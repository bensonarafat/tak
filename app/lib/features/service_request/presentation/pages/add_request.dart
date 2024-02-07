import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tak/core/services/get_it_services.dart';
import 'package:tak/features/service_request/presentation/bloc/service_request_bloc.dart';
import 'package:tak/features/service_request/presentation/widgets/checkbox_location.dart';
import 'package:tak/features/service_request/presentation/widgets/description_field.dart';
import 'package:tak/features/service_request/presentation/widgets/maintenance_checkbox.dart';
import 'package:tak/features/service_request/presentation/widgets/name_field.dart';
import 'package:tak/features/service_request/presentation/widgets/priority_dropdown.dart';
import 'package:tak/features/service_request/presentation/widgets/section_dropdown.dart';
import 'package:tak/features/service_request/presentation/widgets/submit_button.dart';

class AddRequest extends StatefulWidget {
  final String houseId;
  const AddRequest({
    super.key,
    required this.houseId,
  });

  @override
  State<AddRequest> createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  String? name;
  String? description;
  String? priority;
  String? section;
  List<String> maintenance = [];
  List<String> location = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceRequestBloc>(
      create: (_) => getIt<ServiceRequestBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'New Service Request',
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 16.h),
            child: Column(
              children: [
                NameField(
                  callback: (v) {
                    setState(() {
                      name = v;
                    });
                  },
                ),
                Gap(16.h),
                SectionDropdown(callback: (v) {
                  setState(() {
                    section = v;
                  });
                }),
                Gap(16.h),
                section == "Maintenance"
                    ? Column(
                        children: [
                          MaintenanceCheckBox(
                            callback: (value) {
                              setState(() {
                                maintenance = value;
                              });
                            },
                          ),
                          Gap(16.h),
                        ],
                      )
                    : Container(),

                section == "Maintenance"
                    ? Column(
                        children: [
                          CheckBoxLocation(
                            callback: (value) {
                              setState(() {
                                location = value;
                              });
                            },
                          ),
                          Gap(16.h),
                        ],
                      )
                    : Container(),

                DescriptionField(
                  callback: (v) {
                    setState(() {
                      description = v;
                    });
                  },
                ),
                Gap(16.h),
                PriorityDropdown(callback: (v) {
                  setState(() {
                    priority = v;
                  });
                }),
                Gap(16.h),
                SubmitButton(
                  name: name,
                  description: description,
                  priority: priority,
                  houseId: widget.houseId,
                  section: section,
                  location: location,
                  maintenance: maintenance,
                ),
                //button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
