import 'package:bloc/bloc.dart';
import 'dart:async';

import './authentication_event.dart';
import './authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState.unauthenticated());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStatusChanged) {
      switch (event.status) {
        case AuthenticationStatus.unauthenticated:
          yield AuthenticationState.unauthenticated();

          break;

        case AuthenticationStatus.authenticated:
          if (event.user != null) {
            yield AuthenticationState.authenticated(event.user);
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
    }
  }
}
