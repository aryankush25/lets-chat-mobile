import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contacts/contacts.dart';
import '../../utils/constants/menu_options.dart';

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContactsBloc()
        ..add(
          ContactsFetched(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Select Contact'),
          actions: [
            BlocBuilder<ContactsBloc, ContactsState>(
              builder: (context, state) {
                if (state is ContactsInitial) {
                  return FittedBox();
                }

                return PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (_) => CONTACTS_MENU_OPTIONS.map(
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
                    if (value == 'refresh') {
                      BlocProvider.of<ContactsBloc>(context)
                          .add(ContactsRefetched());
                    }

                    print('Selected value - $value');
                  },
                );
              },
            )
          ],
        ),
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        if (state is ContactsInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ContactsFailure) {
          return Center(
            child: Text('Failed to fetch contacts'),
          );
        }

        if (state is ContactsSuccess) {
          return Container(
            child: ListView(
              children: state.contacts
                  .map(
                    (contact) => ListTile(
                      contentPadding: EdgeInsets.all(8),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://www.w3schools.com/howto/img_avatar.png',
                        ),
                        backgroundColor: Colors.tealAccent.shade100,
                        radius: 30,
                      ),
                      title: Text(
                        contact.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        contact.email,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        }

        return Text('no posts');
      },
    );
  }
}
