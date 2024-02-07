import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SectionDropdown extends StatefulWidget {
  final Function callback;
  const SectionDropdown({
    super.key,
    required this.callback,
  });

  @override
  State<SectionDropdown> createState() => _SectionDropdownState();
}

class _SectionDropdownState extends State<SectionDropdown> {
  final List<String> items = ['Maintenance', 'Security', 'Others'];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Section",
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
              'Select section',
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
