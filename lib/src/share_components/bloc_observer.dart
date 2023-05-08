import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/until.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    Logger.d('EVENT', 'Bloc: ${bloc.runtimeType}, Event: ${event.runtimeType}');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Logger.d('ERROR', 'Bloc: ${bloc.runtimeType}, Error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    Logger.d('TRANSITION', '${bloc.runtimeType} , Transition: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    Logger.d('CLOSE', '${bloc.runtimeType}');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    Logger.d('CREATE', '${bloc.runtimeType}');
    super.onCreate(bloc);
  }
}
