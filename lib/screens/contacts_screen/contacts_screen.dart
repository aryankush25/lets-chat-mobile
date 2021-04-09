import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contacts/contacts.dart';
import '../../utils/constants/menu_options.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ContactsBloc>(context).add(
      ContactsFetched(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: ListView.builder(
              itemCount: state.contacts.length,
              itemBuilder: (BuildContext context, int index) {
                final contact = state.contacts[index];

                return ListTile(
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
                );
              },
            ),
          );
        }

        return Text('no posts');
      },
    );
  }
}
