import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import './authentication_event.dart';
import './authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState.unknown());

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

            await prefs.setString('authToken', event.user.token);
          } else {
            yield AuthenticationState.unauthenticated();
          }
          break;

        default:
          yield AuthenticationState.unauthenticated();
          break;
      }
    } else if (event is AuthenticationLogoutRequested) {
      yield AuthenticationState.unauthenticated();
    } else if (event is AuthenticationVerifyRequested) {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        String token = prefs.getString('authToken');

        print('#### token $token');

        if (token != null) {
          add(AuthenticationStatusChanged(
            status: AuthenticationStatus.authenticated,
          ));
        } else {
          add(AuthenticationStatusChanged(
            status: AuthenticationStatus.unauthenticated,
          ));
        }
      } catch (e) {}
    }
  }
}
