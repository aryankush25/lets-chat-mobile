import 'package:flutter_bloc/flutter_bloc.dart';

import './contacts_event.dart';
import './contacts_state.dart';
import '../../repository/user_repository.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final UserRepository usersRepository;

  ContactsBloc()
      : usersRepository = UserRepository(),
        super(ContactsInitial());

  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async* {
    if (event is ContactsFetched && state is ContactsInitial) {
      yield* _mapContactsFetchToState(state);
    } else if (event is ContactsRefetched) {
      yield ContactsInitial();

      yield* _mapContactsFetchToState(state);
    }
  }

  Stream<ContactsState> _mapContactsFetchToState(
    ContactsState state,
  ) async* {
    final response = await usersRepository.fetchContacts();

    if (response.success) {
      yield ContactsSuccess(contacts: response.body);
    } else {
      yield ContactsFailure();
    }
  }
}
