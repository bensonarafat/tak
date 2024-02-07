import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tak/core/constants/assets.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: const Text(
          'Notification',
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250.w,
              height: 250.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(notificationBell),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Gap(16.h),
            Text(
              'No Notifications Available',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
