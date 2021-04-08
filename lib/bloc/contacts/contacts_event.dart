import 'package:equatable/equatable.dart';

abstract class ContactsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ContactsFetched extends ContactsEvent {}

class ContactsRefetched extends ContactsEvent {}
