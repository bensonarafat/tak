import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/core/constants/assets.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/features/home/presentation/widgets/transaction_widget_credit.dart';
import 'package:tak/features/home/presentation/widgets/transaction_widget_debit.dart';
import 'package:tak/features/transactions/presentation/widgets/balance_widget.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  List<dynamic> transations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Invoices & Payments',
        ),
      ),
      body: transations.isNotEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150.w,
                    height: 150.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(transactionBox),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Gap(16.h),
                  Text(
                    'No Transactions Available',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BalanceWidget(),
                  Gap(16.h),
                  Container(
                    margin: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Invoices",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.push("/invoices");
                            },
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
                      ],
                    ),
                  ),
                  Gap(16.h),
                  Container(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        const TransactionWidgetDebit(status: 'Rent Due'),
                        Gap(8.h),
                        const TransactionWidgetDebit(
                            status: 'Service Charge Request'),
                        Gap(8.h),
                        const TransactionWidgetDebit(status: 'Rent Due'),
                      ],
                    ),
                  ),
                  Gap(16.h),
                  Container(
                    margin: EdgeInsets.only(left: 16.w, right: 16.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Payments",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.push("/payments");
                            },
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
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        const TransactionWidgetCredit(status: 'Rent Payment'),
                        Gap(8.h),
                        const TransactionWidgetCredit(
                            status: 'Service Charge Payment'),
                        Gap(8.h),
                        const TransactionWidgetCredit(status: 'Rent Payment'),
                      ],
                    ),
                  ),
                  Gap(16.h),
                ],
              ),
            ),
    );
  }
}
