import 'package:flutter/material.dart';

import '../../utils/constants/route_names.dart';
import '../../utils/helpers/date_helpers.dart';
import '../../utils/helpers/navigator_keys.dart';
import '../../models/user.dart';
import './latestUsers.dart';

class ChatsScreen extends StatelessWidget {
  onTapList(User user, BuildContext context) {
    NavigatorKeys.getHomeNavigatorKeyCurrentState.pushNamed(
      Routes.CHAT,
      arguments: user,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: latestUsers.map(
          (user) {
            return ListTile(
              onTap: () => onTapList(user, context),
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
        ).toList(),
      ),
    );
  }
}
