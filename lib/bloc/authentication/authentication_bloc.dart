import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import './authentication_event.dart';
import './authentication_state.dart';
import '../../repository/user_repository.dart';
import '../../models/user.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc()
      : _userRepository = UserRepository(),
        super(AuthenticationState.unknown());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStatusChanged) {
      switch (event.status) {
        case AuthenticationStatus.unknown:
          yield AuthenticationState.unknown();
          break;

        case AuthenticationStatus.unauthenticated:
          yield AuthenticationState.unauthenticated();
          break;

        case AuthenticationStatus.authenticated:
          if (event.user != null) {
            SharedPreferences prefs = await SharedPreferences.getInstance();

            yield AuthenticationState.authenticated(event.user);

            if (event.user.token != null) {
              await prefs.setString('authToken', event.user.token);
            }
          } else {
            yield AuthenticationState.unauthenticated();
          }
          break;

        default:
          yield AuthenticationState.unauthenticated();
          break;
      }
    } else if (event is AuthenticationLogoutRequested) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('authToken', '');

      yield AuthenticationState.unauthenticated();
    } else if (event is AuthenticationVerifyRequested) {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        String token = prefs.getString('authToken');

        if (token != null && token != '') {
          User user = await _userRepository.me(token: token);

          add(AuthenticationStatusChanged(
            status: AuthenticationStatus.authenticated,
            user: user,
          ));
        } else {
          add(AuthenticationStatusChanged(
            status: AuthenticationStatus.unauthenticated,
          ));
        }
      } catch (e) {
        add(AuthenticationStatusChanged(
          status: AuthenticationStatus.unauthenticated,
        ));
      }
    }
  }
}
