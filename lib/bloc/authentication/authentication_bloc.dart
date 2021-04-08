import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import './authentication_event.dart';
import './authentication_state.dart';
import '../../repository/user_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc()
      : userRepository = UserRepository(),
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
    } else if (event is AuthenticationVerifyRequested) {
      var response = await userRepository.verifyAuth();

      if (response.success) {
        add(
          AuthenticationStatusChanged(
            status: AuthenticationStatus.authenticated,
            user: response.body,
          ),
        );
      } else {
        add(
          AuthenticationStatusChanged(
            status: AuthenticationStatus.unauthenticated,
          ),
        );
      }
    } else if (event is AuthenticationLogoutRequested) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('authToken', '');

      yield AuthenticationState.unauthenticated();
    }
  }
}
