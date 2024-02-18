import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/features/transactions/presentation/bloc/transaction_bloc.dart';
import 'package:tak/features/transactions/presentation/widgets/invoice_widget.dart';

class Invoices extends StatefulWidget {
  const Invoices({super.key});

  @override
  State<Invoices> createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> {
  String startDate = '';
  String endDate = '';
  @override
  void initState() {
    DateTime now = DateTime.now();
    DateTime startDateYear = now.subtract(const Duration(days: 730));
    endDate = DateFormat('yyyy-MM-dd').format(now);
    startDate = DateFormat('yyyy-MM-dd').format(startDateYear);

    context
        .read<TransactionBloc>()
        .add(InvoiceTransactionFetch(startDate: '', endDate: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Invoices',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 16.h),
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        getDate(context).then((DateTime? value) {
                          if (value != null) {
                            setState(() {
                              startDate =
                                  DateFormat('yyyy-MM-dd').format(value);
                            });
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 8.w, right: 8.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                            color: const Color.fromARGB(255, 184, 180, 180),
                          ),
                        ),
                        padding: EdgeInsets.all(8.w),
                        child: Row(
                          children: [
                            const HeroIcon(HeroIcons.calendar),
                            Gap(8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Start Date",
                                  style: TextStyle(fontSize: 11.sp),
                                ),
                                Text(startDate),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        getDate(context).then((DateTime? value) {
                          if (value != null) {
                            setState(() {
                              endDate = DateFormat('yyyy-MM-dd').format(value);
                            });
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 8.w, right: 8.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                            color: const Color.fromARGB(255, 184, 180, 180),
                          ),
                        ),
                        padding: EdgeInsets.all(8.w),
                        child: Row(
                          children: [
                            const HeroIcon(HeroIcons.calendar),
                            Gap(8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "End Date",
                                  style: TextStyle(fontSize: 11.sp),
                                ),
                                Text(endDate),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<TransactionBloc>().add(
                            InvoiceTransactionFetch(
                                startDate: startDate, endDate: endDate));
                      },
                      child: Container(
                        height: 65.h,
                        margin: EdgeInsets.only(left: 8.w, right: 8.w),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                            color: primaryColor,
                          ),
                        ),
                        padding: EdgeInsets.all(8.w),
                        child: const HeroIcon(
                          HeroIcons.funnel,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(16.h),
            const InvoiceWidget(),
          ],
        ),
      ),
    );
  }
}
