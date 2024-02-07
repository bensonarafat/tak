import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tak/core/services/get_it_services.dart';
import 'package:tak/features/visitors/domain/entities/visitors_entity.dart';
import 'package:tak/features/visitors/presentation/bloc/visitors_bloc.dart';
import 'package:tak/features/visitors/presentation/widgets/date_arrival.dart';
import 'package:tak/features/visitors/presentation/widgets/date_departure.dart';
import 'package:tak/features/visitors/presentation/widgets/phone_field.dart';
import 'package:tak/features/visitors/presentation/widgets/update_button.dart';
import 'package:tak/features/visitors/presentation/widgets/visitor_name_field.dart';

class EditVisitor extends StatefulWidget {
  final VisitorsEntity visitorsEntity;
  const EditVisitor({
    super.key,
    required this.visitorsEntity,
  });

  @override
  State<EditVisitor> createState() => _EditVisitorState();
}

class _EditVisitorState extends State<EditVisitor> {
  String? id;
  String? visitorName;
  String? visitorPhoneNumber;
  String? carRegNo;
  String? reason;
  String? destination;
  String? arrival;
  String? departure;

  @override
  void initState() {
    visitorName = widget.visitorsEntity.visitorName;
    visitorPhoneNumber = widget.visitorsEntity.phone;
    arrival = widget.visitorsEntity.arrival;
    departure = widget.visitorsEntity.departure;
    id = widget.visitorsEntity.id.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VisitorsBloc>(
      create: (context) => getIt<VisitorsBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Visitor',
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Column(
              children: [
                VisitorNameField(
                  value: visitorName ?? '',
                  callback: (v) {
                    setState(() {
                      visitorName = v;
                    });
                  },
                ),
                Gap(16.h),
                PhoneField(
                  value: visitorPhoneNumber ?? '',
                  callback: (v) {
                    setState(() {
                      visitorPhoneNumber = v;
                    });
                  },
                ),
                Gap(16.h),
                DateArrival(
                  value: arrival ?? '',
                  callback: (v) {
                    setState(() {
                      arrival = v;
                    });
                  },
                ),
                Gap(16.h),
                DateDeparture(
                  value: arrival ?? '',
                  callback: (v) {
                    setState(() {
                      departure = v;
                    });
                  },
                ),
                Gap(16.h),
                UpdateButton(
                  visitorName: visitorName,
                  visitorPhoneNumber: visitorPhoneNumber,
                  arrival: arrival,
                  departure: departure,
                  id: id,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
