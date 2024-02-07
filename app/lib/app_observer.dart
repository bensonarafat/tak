import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class AppObserver implements BlocObserver {
  final Logger logger;

  AppObserver({required this.logger});

  @override
  void onChange(BlocBase bloc, Change change) {
    // logger.i("On Change >> $change");
  }

  @override
  void onClose(BlocBase bloc) {}

  @override
  void onCreate(BlocBase bloc) {}

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {}

  @override
  void onEvent(Bloc bloc, Object? event) {
    // logger.i("Event >> $event");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {}
}
