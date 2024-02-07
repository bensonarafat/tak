part of 'countdown_cubit.dart';

@immutable
abstract class CountDownState extends Equatable {}

class CountDownInitial extends CountDownState {
  final Duration duration;

  CountDownInitial({required this.duration});

  @override
  List<Object?> get props => [duration];
}

class CountDownCompleted extends CountDownState {
  @override
  List<Object?> get props => [];
}

class CountDownUpdate extends CountDownState {
  final Duration duration;

  CountDownUpdate({required this.duration});

  @override
  List<Object?> get props => [duration];
}
