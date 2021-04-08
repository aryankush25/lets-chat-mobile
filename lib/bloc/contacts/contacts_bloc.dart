import 'package:flutter_bloc/flutter_bloc.dart';

import './contacts_event.dart';
import './contacts_state.dart';
import '../../repository/users_repository.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final UsersRepository usersRepository;

  ContactsBloc()
      : usersRepository = UsersRepository(),
        super(ContactsInitial());

  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async* {
    if (event is ContactsFetched && state is ContactsInitial) {
      yield* _mapContactsFetchToState(event, state);
    } else if (event is ContactsRefetched) {
      yield ContactsInitial();

      yield* _mapContactsFetchToState(event, state);
    }
  }

  Stream<ContactsState> _mapContactsFetchToState(
    ContactsEvent event,
    ContactsState state,
  ) async* {
    final response = await usersRepository.fetchContacts();

    if (response.success) {
      yield ContactsSuccess(contacts: response.body);
    } else {
      yield ContactsFailure();
    }
  }

  @override
  void onTransition(Transition transition) {
    print('Bloc Log >>> $transition');

    super.onTransition(transition);
  }
}
