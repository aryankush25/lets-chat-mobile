import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../models/user.dart';

abstract class ContactsState extends Equatable {
  const ContactsState();

  @override
  List<Object> get props => [];
}

class ContactsInitial extends ContactsState {}

class ContactsFailure extends ContactsState {}

class ContactsSuccess extends ContactsState {
  final List<User> contacts;

  const ContactsSuccess({
    @required this.contacts,
  });

  @override
  List<Object> get props => [contacts];
}
