import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/core/widgets/tak_along_loading.dart';
import 'package:tak/features/visitors/presentation/bloc/visitors_bloc.dart';

class UpdateButton extends StatelessWidget {
  final String? visitorPhoneNumber;
  final String? visitorName;
  final String? arrival;
  final String? departure;
  final String? id;
  const UpdateButton({
    super.key,
    required this.visitorPhoneNumber,
    required this.visitorName,
    required this.arrival,
    required this.departure,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VisitorsBloc, VisitorState>(
      listener: (context, state) {
        if (state is VisitorLoadedState) {
          toast(state.visitorEntity.message);
          if (state.visitorEntity.status) {
            context.pop();
          }
        }
        if (state is VisitorErrorState) {
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
            child: state is VisitorLoadingState
                ? const TakLoading()
                : Text(
                    "Update",
                    style: GoogleFonts.robotoFlex(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  ),
            onPressed: () {
              if (id == null) {
                toast("Oops, there was an error");
              } else if (visitorName == null) {
                toast("Visitor Name is required");
              } else if (visitorPhoneNumber == null) {
                toast("Visitor Phone number is required");
              } else if (arrival == null) {
                toast("Arrival Date is required");
              } else if (departure == null) {
                toast("Departure Date is required");
              } else {
                context.read<VisitorsBloc>().add(
                      EditVisitorEvent(
                        id: id!,
                        phone: visitorPhoneNumber!,
                        arrival: arrival!,
                        departure: departure!,
                        carRegno: '',
                        reason: '',
                        destination: '',
                        visitorName: visitorName!,
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
