import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PriorityDropdown extends StatefulWidget {
  final Function callback;
  const PriorityDropdown({
    super.key,
    required this.callback,
  });

  @override
  State<PriorityDropdown> createState() => _PriorityDropdownState();
}

class _PriorityDropdownState extends State<PriorityDropdown> {
  final List<String> items = ['Low', 'Medium', 'High'];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Priority",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Gap(4.h),
          DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            hint: Text(
              'Select request priority',
              style: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: items
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (String? value) {
              setState(() {
                widget.callback(value);
              });
            },
            buttonStyleData: ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              width: 140.w,
            ),
            menuItemStyleData: MenuItemStyleData(
              height: 40.h,
            ),
          ),
        ],
      ),
    );
  }
}
