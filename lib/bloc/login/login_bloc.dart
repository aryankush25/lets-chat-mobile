import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

import './login_event.dart';
import './login_state.dart';
import '../../form/password.dart';
import '../../form/email.dart';
import '../../repository/user_repository.dart';
import '../authentication/authentication.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;
  final AuthenticationBloc _authenticationBloc;

  LoginBloc({authenticationBloc})
      : _userRepository = UserRepository(),
        _authenticationBloc = authenticationBloc,
        super(const LoginState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginEmailChanged) {
      yield _mapEmailChangedToState(event, state);
    } else if (event is LoginPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event, state);
    }
  }

  LoginState _mapEmailChangedToState(
    LoginEmailChanged event,
    LoginState state,
  ) {
    final email = Email.dirty(event.email);

    return state.copyWith(
      email: email,
      status: Formz.validate([state.password, email]),
    );
  }

  LoginState _mapPasswordChangedToState(
    LoginPasswordChanged event,
    LoginState state,
  ) {
    final password = Password.dirty(event.password);

    return state.copyWith(
      password: password,
      status: Formz.validate([password, state.email]),
    );
  }

  Stream<LoginState> _mapLoginSubmittedToState(
    LoginSubmitted event,
    LoginState state,
  ) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);

      var response = await _userRepository.logInRequest(
        email: state.email.value,
        password: state.password.value,
      );

      if (response.success) {
        yield state.copyWith(status: FormzStatus.submissionSuccess);

        _authenticationBloc.add(AuthenticationStatusChanged(
          status: AuthenticationStatus.authenticated,
          user: response.body,
        ));
      } else {
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
