import 'package:equatable/equatable.dart';

import './authentication_state.dart';
import '../../models/user.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  final AuthenticationStatus status;
  final User user;

  const AuthenticationStatusChanged({
    this.status,
    this.user,
  });

  @override
  List<Object> get props => [status, user];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
