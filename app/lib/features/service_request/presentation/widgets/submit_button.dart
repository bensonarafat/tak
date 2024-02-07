import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/core/widgets/tak_along_loading.dart';
import 'package:tak/features/service_request/presentation/bloc/service_request_bloc.dart';

class SubmitButton extends StatelessWidget {
  final String? name;
  final String? description;
  final String? priority;
  final String houseId;
  final String? section;
  final List<String> location;
  final List<String> maintenance;
  const SubmitButton({
    super.key,
    required this.name,
    required this.description,
    required this.priority,
    required this.houseId,
    required this.location,
    required this.section,
    required this.maintenance,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceRequestBloc, ServiceRequestState>(
      listener: (context, state) {
        if (state is ServiceRequestLoadedState) {
          toast(state.serviceRequestEntity.message);
          if (state.serviceRequestEntity.status) {
            context.pop();
          }
        }
        if (state is ServiceRequestErrorState) {
          toast(state.message);
        }
      },
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
          ),
          width: double.infinity,
          child: TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: primaryColor,
                    width: 1.w,
                  ),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
            ),
            child: state is ServiceRequestLoadingState
                ? const TakLoading()
                : Text(
                    "Submit",
                    style: GoogleFonts.robotoFlex(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
            onPressed: () {
              if (description == null) {
                toast("Description is Required");
              } else if (name == null) {
                toast("Name is required");
              } else if (priority == null) {
                toast("Priority is required");
              } else if (section == null) {
                toast("Select a section");
              } else {
                if (section!.toLowerCase() == "maintenance") {
                  if (maintenance.isEmpty) {
                    toast("You must select at least one maintenance type");
                    return;
                  }
                  if (location.isEmpty) {
                    toast("You must select at least one location");
                    return;
                  }
                }
                context.read<ServiceRequestBloc>().add(
                      AddServiceRequestEvent(
                        description: description!,
                        name: name!,
                        priority: priority!,
                        houseId: houseId,
                        section: section!,
                        maintenance: maintenance,
                        location: location,
                      ),
                    );
              }
            },
          ),
        );
      },
    );
  }
}
