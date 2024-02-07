import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrText extends StatelessWidget {
  const OrText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16.h,
        bottom: 16.h,
      ),
      child: Text(
        "Or".toUpperCase(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
