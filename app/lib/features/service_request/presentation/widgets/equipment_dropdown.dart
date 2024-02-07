import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tak/features/service_request/domain/entities/equipment_entity.dart';
import 'package:tak/features/service_request/presentation/bloc/service_request_bloc.dart';

class EquipmentDropdown extends StatefulWidget {
  final Function callback;
  const EquipmentDropdown({
    super.key,
    required this.callback,
  });

  @override
  State<EquipmentDropdown> createState() => _EquipmentDropdownState();
}

class _EquipmentDropdownState extends State<EquipmentDropdown> {
  List<EquipmentEntity> equipments = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceRequestBloc, ServiceRequestState>(
      builder: (context, state) {
        if (state is EquipmentRequestLoadedState) {
          equipments = state.equipmentEntity;
        }
        return Container(
          margin: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Equipment",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Gap(4.h),
              DropdownButtonFormField2<EquipmentEntity>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                hint: Text(
                  'Select your house equipment',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: equipments
                    .map<DropdownMenuItem<EquipmentEntity>>(
                        (EquipmentEntity item) =>
                            DropdownMenuItem<EquipmentEntity>(
                              value: item,
                              child: Text(
                                item.name,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ))
                    .toList(),
                value: equipments.firstOrNull,
                onChanged: (EquipmentEntity? value) {
                  setState(() {
                    if (value != null) {
                      widget.callback(value.id);
                    }
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
      },
    );
  }
}
