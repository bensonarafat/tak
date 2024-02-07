import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'countdown_state.dart';

class CountDownCubit extends Cubit<CountDownState> {
  CountDownCubit(Duration duration)
      : super(CountDownInitial(duration: duration)) {
    startCountDown();
  }

  late Timer timer;
  late Duration initialDuration;
  void startCountDown() {
    initialDuration = (state as CountDownInitial).duration;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentState = state;
      if (currentState is CountDownInitial) {
        emit(CountDownUpdate(duration: currentState.duration));
      } else if (currentState is CountDownUpdate) {
        if (currentState.duration.inSeconds > 0) {
          emit(CountDownUpdate(
              duration: currentState.duration - const Duration(seconds: 1)));
        } else {
          timer.cancel();
          emit(CountDownCompleted());
        }
      }
    });
  }

  void restartCountDown() {
    timer.cancel();
    emit(CountDownInitial(duration: initialDuration));
    startCountDown();
  }

  @override
  Future<void> close() {
    timer.cancel();
    return super.close();
  }
}
