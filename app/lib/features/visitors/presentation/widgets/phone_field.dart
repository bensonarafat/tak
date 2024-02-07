import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PhoneField extends StatelessWidget {
  final Function callback;
  final String value;
  const PhoneField({
    super.key,
    required this.callback,
    this.value = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Vistor Phone Number",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Gap(4.h),
          SizedBox(
            width: 358.w,
            child: TextFormField(
              initialValue: value,
              keyboardType: TextInputType.phone,
              onChanged: (v) {
                callback(v);
              },
              decoration: const InputDecoration(
                counterText: '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
