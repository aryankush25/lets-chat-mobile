import 'package:flutter/material.dart';

import '../../../utils/constants/menu_options.dart';
import '../../../utils/constants/route_names.dart';
import '../../../utils/helpers/navigator_keys.dart';
import '../../../models/user.dart';

class ChatScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatScreenAppBar({
    @required this.user,
  });

  final User user;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          NavigatorKeys.getHomeNavigatorKeyCurrentState.pop();
        },
      ),
      leadingWidth: 30,
      title: InkWell(
        onTap: () {
          NavigatorKeys.getHomeNavigatorKeyCurrentState.pushNamed(
            Routes.CONTACT_VIEW,
            arguments: user,
          );
        },
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://www.w3schools.com/howto/img_avatar.png',
              ),
              backgroundColor: Colors.tealAccent.shade100,
              radius: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                user.name,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
      actions: [
        IconButton(
          tooltip: 'Video Call',
          color: Colors.white,
          icon: Icon(Icons.videocam),
          onPressed: () {
            print('Video Call');
          },
        ),
        IconButton(
          tooltip: 'Voice Call',
          color: Colors.white,
          icon: Icon(Icons.call),
          onPressed: () {
            print('Voice Call');
          },
        ),
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (_) => CHAT_MENU_OPTIONS.map(
            (menuOption) {
              return PopupMenuItem(
                child: Text(
                  menuOption.label,
                ),
                value: menuOption.id,
              );
            },
          ).toList(),
          onSelected: (value) {
            print('Selected value - $value');
          },
        ),
      ],
    );
  }
}
