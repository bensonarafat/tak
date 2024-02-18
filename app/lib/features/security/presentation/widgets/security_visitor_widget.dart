import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/core/widgets/tak_along_loading.dart';
import 'package:tak/core/widgets/tak_error_widget.dart';
import 'package:tak/features/security/domain/entities/check_entity.dart';
import 'package:tak/features/security/domain/entities/security_visitors_entity.dart';
import 'package:tak/features/security/presentation/bloc/security_bloc.dart';

class SecurityVisitorWidget extends StatefulWidget {
  const SecurityVisitorWidget({super.key});

  @override
  State<SecurityVisitorWidget> createState() => _SecurityVisitorWidgetState();
}

class _SecurityVisitorWidgetState extends State<SecurityVisitorWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SecurityBloc, SecurityState>(
      listener: (context, state) {
        if (state is SecurityCheckErrorState) {
          toast(state.message);
        }

        if (state is SecurityCheckLoadedState) {
          CheckEntity checkEntity = state.checkEntity;
          toast(checkEntity.message);
          if (checkEntity.status) {
            context.read<SecurityBloc>().add(FetchVisitorsEvent());
          }
        }
      },
      buildWhen: (pre, state) {
        return state is SecurityErrorState ||
            state is SecurityLoadedState ||
            state is SecurityLoadingState;
      },
      builder: (context, state) {
        if (state is SecurityErrorState) {
          return const TakErrorWidget();
        } else if (state is SecurityLoadingState) {
          return TakLoading(
            color:
                Theme.of(context).brightness == Brightness.dark ? white : dark,
          );
        } else if (state is SecurityLoadedState) {
          List<SecurityVisitorEntity> visitorsEntity = state.visitors;
          if (visitorsEntity.isEmpty) {
            return Container(
              margin: EdgeInsets.only(left: 14.w, right: 14.w, top: 50.h),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeroIcon(
                    HeroIcons.noSymbol,
                    size: 35.r,
                  ),
                  Gap(5.h),
                  Text(
                    "Expecting no visitors for day!",
                    style: GoogleFonts.robotoFlex(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: visitorsEntity.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                SecurityVisitorEntity visitor = visitorsEntity[index];
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
                    visitor.checkIn == null
                        ? Row(
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                    child: state is SecurityCheckLoadingState
                                        ? const TakLoading()
                                        : Text(
                                            "Check-In",
                                            style: GoogleFonts.robotoFlex(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: white,
                                            ),
                                          ),
                                    onPressed: () {
                                      context.read<SecurityBloc>().add(
                                          CheckInEvent(
                                              visitorId:
                                                  visitor.id.toString()));
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
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
