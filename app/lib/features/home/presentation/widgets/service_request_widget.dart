import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/widgets/tak_along_loading.dart';
import 'package:tak/core/widgets/tak_error_widget.dart';
import 'package:tak/features/home/presentation/widgets/service_request_card.dart';
import 'package:tak/features/service_request/domain/entities/service_requests_entity.dart';
import 'package:tak/features/service_request/presentation/bloc/service_request_bloc.dart';

class ServiceRequestWidget extends StatelessWidget {
  final String houseId;
  const ServiceRequestWidget({
    super.key,
    required this.houseId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceRequestBloc, ServiceRequestState>(
      buildWhen: (pre, state) {
        return state is ServiceRequestLoadingState ||
            state is ServiceRequestsLoadedState ||
            state is ServiceRequestErrorState;
      },
      builder: (context, state) {
        if (state is ServiceRequestLoadingState) {
          return TakLoading(
            color:
                Theme.of(context).brightness == Brightness.dark ? white : dark,
          );
        } else if (state is ServiceRequestErrorState) {
          return const TakErrorWidget();
        } else if (state is ServiceRequestsLoadedState) {
          List<ServiceRequestsEntity> serviceRequests = state.servicesRequests;

          if (serviceRequests.isEmpty) {
            return GestureDetector(
              onTap: () {
                context.push("/add-request", extra: houseId).then((value) {
                  context
                      .read<ServiceRequestBloc>()
                      .add(GetServiceRequestsEvent());
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 14.w, right: 14.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.grey),
                ),
                height: 120.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeroIcon(
                      HeroIcons.plus,
                      size: 35.r,
                    ),
                    Gap(5.h),
                    Text(
                      "Create New",
                      style: GoogleFonts.robotoFlex(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return SizedBox(
              height: 120.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: serviceRequests.length,
                  itemBuilder: (context, index) {
                    ServiceRequestsEntity request = serviceRequests[index];
                    return ServiceRequestCard(request: request);
                  }),
            );
          }
        } else {
          return TakLoading(
            color:
                Theme.of(context).brightness == Brightness.dark ? white : dark,
          );
        }
      },
    );
  }
}
