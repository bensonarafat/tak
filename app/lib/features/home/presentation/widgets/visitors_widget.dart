import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/core/widgets/tak_along_loading.dart';
import 'package:tak/core/widgets/tak_error_widget.dart';
import 'package:tak/features/visitors/domain/entities/visitors_entity.dart';
import 'package:tak/features/visitors/presentation/bloc/visitors_bloc.dart';

class VisitorsWidget extends StatefulWidget {
  const VisitorsWidget({super.key});

  @override
  State<VisitorsWidget> createState() => _VisitorsWidgetState();
}

class _VisitorsWidgetState extends State<VisitorsWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisitorsBloc, VisitorState>(
      buildWhen: (pre, state) {
        return state is VisitorErrorState ||
            state is VisitorsLoadedState ||
            state is VisitorLoadingState;
      },
      builder: (context, state) {
        if (state is VisitorErrorState) {
          return const TakErrorWidget();
        } else if (state is VisitorLoadingState) {
          return TakLoading(
            color:
                Theme.of(context).brightness == Brightness.dark ? white : dark,
          );
        } else if (state is VisitorsLoadedState) {
          List<VisitorsEntity> visitorsEntity = state.visitorsEntity;
          if (visitorsEntity.isEmpty) {
            return GestureDetector(
              onTap: () {
                context.push("/add-visitor").then((value) {
                  context.read<VisitorsBloc>().add(GetVisitorsEvent());
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
            return ListView.builder(
              itemCount: visitorsEntity.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                VisitorsEntity visitor = visitorsEntity[index];
                return ExpansionTile(
                  title: Text(
                    visitor.visitorName,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  subtitle: Text(visitor.phone),
                  leading: const Icon(Icons.person),
                  trailing:
                      Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "Arrival",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                convertDate(visitor.arrival),
                                textAlign: TextAlign.end,
                              )),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "Departure",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                convertDate(visitor.departure),
                                textAlign: TextAlign.end,
                              )),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Check-In",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              visitor.checkIn == null
                                  ? Text(
                                      "Pending",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            color: Colors.red,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                    )
                                  : HeroIcon(
                                      HeroIcons.checkBadge,
                                      color: Colors.green[800],
                                    ),
                            ],
                          ),
                          visitor.checkIn == null
                              ? Container()
                              : const Divider(),
                          visitor.checkIn == null
                              ? Container()
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Check-Out",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                    visitor.checkOut == null
                                        ? Text(
                                            "Pending",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  color: Colors.red,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          )
                                        : HeroIcon(
                                            HeroIcons.checkBadge,
                                            color: Colors.green[800],
                                          ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 8.w,
                              right: 8.w,
                              bottom: 8.h,
                            ),
                            child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                      color: primaryColor,
                                      width: 1.w,
                                    ),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  primaryColor,
                                ),
                              ),
                              child: Text(
                                "Edit",
                                style: GoogleFonts.robotoFlex(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: white,
                                ),
                              ),
                              onPressed: () =>
                                  context.push("/edit-visitor", extra: visitor),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 8.w,
                              right: 8.w,
                              bottom: 8.h,
                            ),
                            child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                      color: Colors.red,
                                      width: 1.w,
                                    ),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.red,
                                ),
                              ),
                              child: state is VisitorLoadingState
                                  ? const TakLoading()
                                  : Text(
                                      "Delete",
                                      style: GoogleFonts.robotoFlex(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: white,
                                      ),
                                    ),
                              onPressed: () =>
                                  context.push("/edit-visitor", extra: visitor),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                  onExpansionChanged: (expanded) =>
                      setState(() => _isExpanded = expanded),
                );
              },
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
