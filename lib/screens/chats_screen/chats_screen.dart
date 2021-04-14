import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants/route_names.dart';
import '../../utils/helpers/date_helpers.dart';
import '../../utils/helpers/navigator_keys.dart';
import '../../models/user.dart';
import '../../bloc/chats/chats.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ChatsBloc>(context).add(
      ChatsFetched(),
    );
  }

  onTapList(User user) {
    NavigatorKeys.getHomeNavigatorKeyCurrentState.pushNamed(
      Routes.CHAT,
      arguments: user,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(
      builder: (context, state) {
        if (state is ChatsInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ChatsFailure) {
          return Center(
            child: Text('Failed to fetch contacts'),
          );
        }

        if (state is ChatsSuccess) {
          return Container(
              child: ListView.builder(
            itemCount: state.chats.length,
            itemBuilder: (context, index) {
              final user = state.chats[index];

              return ListTile(
                onTap: () => onTapList(user),
                contentPadding: EdgeInsets.all(8),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://www.w3schools.com/howto/img_avatar.png',
                  ),
                  backgroundColor: Colors.tealAccent.shade100,
                  radius: 30,
                ),
                title: Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  user.latestChat.content,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                trailing: Container(
                  child: Column(
                    children: [
                      Text(
                        DateHelpers.formattedDate(
                          user.latestChat.createdAt,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ));
        }

        return Text('No chats!');
      },
    );
  }
}
