import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../form/password.dart';
import '../../form/email.dart';

class LoginState extends Equatable {
  final FormzStatus status;
  final Email email;
  final Password password;

  const LoginState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  LoginState copyWith({
    FormzStatus status,
    Email email,
    Password password,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, email, password];
}
