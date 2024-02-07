import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class BottomNavigateionEvent {}

class TabChange extends BottomNavigateionEvent {
  final int index;

  TabChange({required this.index});
}
