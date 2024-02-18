import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/core/constants/constants.dart';
import 'package:tak/core/data/models/user_model.dart';
import 'package:tak/core/domain/entities/tenant_house_entity.dart';
import 'package:tak/core/services/get_it_services.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/extensions.dart';
import 'package:tak/core/widgets/tak_cache_network_image.dart';
import 'package:tak/features/home/presentation/widgets/carousel_widget.dart';
import 'package:tak/features/home/presentation/widgets/house_banner_widget.dart';
import 'package:tak/features/home/presentation/widgets/service_request_widget.dart';
import 'package:tak/features/home/presentation/widgets/visitors_widget.dart';
import 'package:tak/features/service_request/presentation/bloc/service_request_bloc.dart';
import 'package:tak/features/transactions/presentation/bloc/transaction_bloc.dart';
import 'package:tak/features/transactions/presentation/widgets/rent_balance_widget.dart';
import 'package:tak/features/transactions/presentation/widgets/service_balance_widget.dart';
import 'package:tak/features/visitors/presentation/bloc/visitors_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SecureStorage secureStorage = getIt<SecureStorage>();
  String avatar = imageplaceholder;
  String name = "";
  String role = "";
  String status = "";
  String houseId = '';
  TenantHouseEntity? tenantHouseEntity;
  @override
  void initState() {
    super.initState();
    _getUserData();

    context.read<TransactionBloc>().add(BalanceTransactionFetch());
  }

  _getUserData() async {
    UserModel? usermodel = await secureStorage.getUserData();
    setState(() {
      name = "${usermodel?.name}".inCaps;
      avatar = usermodel?.avatar ?? imageplaceholder;
      role = "${usermodel?.role}".inCaps;
      status = "${usermodel?.status}";
      houseId = "${usermodel?.tenantHouse?.houseId}";
      tenantHouseEntity = usermodel?.tenantHouse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServiceRequestBloc>(
          create: (BuildContext context) =>
              getIt<ServiceRequestBloc>()..add(GetServiceRequestsEvent()),
        ),
        BlocProvider<VisitorsBloc>(
          create: (BuildContext context) =>
              getIt<VisitorsBloc>()..add(GetVisitorsEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => context.push("/settings"),
              icon: const Icon(Icons.settings),
            ),
          ],
          leading: GestureDetector(
            onTap: () => context.push("/profile"),
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: TakCachedNetworkImage(
                path: avatar,
                width: 20,
                height: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: GestureDetector(
            onTap: () => context.push("/profile"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.robotoFlex(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  role,
                  style: GoogleFonts.robotoFlex(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Column(
              children: [
                status != "approved"
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: primaryColor,
                        ),
                        padding: EdgeInsets.only(
                          left: 8.w,
                          right: 8.w,
                          bottom: 8.h,
                          top: 8.h,
                        ),
                        child: Text(
                          "Account not yet approved, once approved you will be to do do other things with the app",
                          style: GoogleFonts.robotoFlex(
                            color: white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    : Container(),
                Gap(16.h),
                const CarouselWidget(),
                Gap(16.h),
                HouseBannerWidget(tenantHouseEntity: tenantHouseEntity),
                Gap(16.h),
                GestureDetector(
                  onTap: () => context.push('/transactions'),
                  child: const RentBalanceWidget(),
                ),
                Gap(16.h),
                GestureDetector(
                  onTap: () => context.push('/transactions'),
                  child: const ServiceBalanceWidget(),
                ),
                Gap(16.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Service Requests",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => context.push('/service-requests'),
                        child: Text(
                          "See more",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.robotoFlex(
                            color: primaryColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Gap(16.h),
                  ],
                ),
                Gap(16.h),
                ServiceRequestWidget(houseId: houseId),
                Gap(16.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Visitors",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => context.push('/visitors'),
                        child: Text(
                          "See more",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.robotoFlex(
                            color: primaryColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Gap(16.h),
                  ],
                ),
                Gap(16.h),
                const VisitorsWidget(),
                Gap(16.h),
              ],
            ),
          ),
        ),
        floatingActionButton: _getFAB(),
      ),
    );
  }

  Widget _getFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.sp, color: white),
      backgroundColor: primaryColor,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: const Icon(
            Icons.person_pin,
            color: white,
          ),
          backgroundColor: primaryColor,
          onTap: () async {
            await context.push("/add-visitor");
            // ignore: use_build_context_synchronously
            context.read<VisitorsBloc>().add(GetVisitorsEvent());
          },
          label: 'New Vistor',
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500, color: white, fontSize: 16.0.sp),
          labelBackgroundColor: primaryColor,
        ),
        SpeedDialChild(
          child: const Icon(
            Icons.miscellaneous_services_sharp,
            color: white,
          ),
          backgroundColor: primaryColor,
          onTap: () async {
            await context.push("/add-request", extra: houseId);
            // ignore: use_build_context_synchronously
            context.read<ServiceRequestBloc>().add(GetServiceRequestsEvent());
          },
          label: 'Service Request',
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500, color: white, fontSize: 16.0.sp),
          labelBackgroundColor: primaryColor,
        )
      ],
    );
  }
}
