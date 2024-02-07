part of 'visitors_bloc.dart';

@immutable
abstract class VisitorState extends Equatable {}

class VisitorInitState extends VisitorState {
  @override
  List<Object?> get props => [];
}

class VisitorLoadingState extends VisitorState {
  @override
  List<Object?> get props => [];
}

class VisitorLoadedState extends VisitorState {
  final VisitorEntity visitorEntity;

  VisitorLoadedState({required this.visitorEntity});
  @override
  List<Object?> get props => [visitorEntity];
}

class VisitorsLoadedState extends VisitorState {
  final List<VisitorsEntity> visitorsEntity;

  VisitorsLoadedState({required this.visitorsEntity});

  @override
  List<Object?> get props => [visitorsEntity];
}

class VisitorErrorState extends VisitorState {
  final String message;

  VisitorErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
