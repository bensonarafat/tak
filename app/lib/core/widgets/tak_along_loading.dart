import 'package:flutter/cupertino.dart';
import 'package:tak/core/utils/colors.dart';

class TakLoading extends StatelessWidget {
  final Color color;
  const TakLoading({super.key, this.color = white});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color,
      ),
    );
  }
}
