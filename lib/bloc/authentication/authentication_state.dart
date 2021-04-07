import 'package:equatable/equatable.dart';

import '../../models/user.dart';

enum AuthenticationStatus { authenticated, unauthenticated }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User user;

  const AuthenticationState._({
    this.status = AuthenticationStatus.unauthenticated,
    this.user = User.empty,
  });

  const AuthenticationState.authenticated(User user)
      : this._(
          status: AuthenticationStatus.authenticated,
          user: user,
        );

  const AuthenticationState.unauthenticated() : this._();

  @override
  List<Object> get props => [status, user];
}
