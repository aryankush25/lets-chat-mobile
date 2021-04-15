import 'package:bloc/bloc.dart';

class GlobalBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    // print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    // print('Bloc Log >>> $transition');

    super.onTransition(bloc, transition);
  }
}
