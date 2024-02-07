import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class BottomNavigationState {
  final int index;

  const BottomNavigationState({required this.index});
}

class BottomNavigationInitial extends BottomNavigationState {
  const BottomNavigationInitial({required super.index});
}
