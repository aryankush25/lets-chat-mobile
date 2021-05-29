import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './app_view.dart';
import '../bloc/authentication/authentication.dart';
import '../bloc/contacts/contacts.dart';
import '../bloc/chats/chats_bloc.dart';
import '../bloc/user_chats/user_chats.dart';
import '../repository/socket_io_repository.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SocketIoRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc()
              ..add(
                AuthenticationVerifyRequested(),
              ),
          ),
          BlocProvider(
            create: (_) => ContactsBloc(),
          ),
          BlocProvider(
            create: (_) => ChatsBloc(),
          ),
          BlocProvider(
            create: (_) => UserChatsBloc(),
          ),
        ],
        child: AppView(),
      ),
    );
  }
}
