import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tak/core/utils/colors.dart';
import 'package:tak/features/transactions/presentation/bloc/transaction_bloc.dart';
import 'package:tak/features/transactions/presentation/widgets/invoice_widget.dart';
import 'package:tak/features/transactions/presentation/widgets/payment_widget.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  String startDate = '';
  String endDate = '';
  @override
  void initState() {
    context.read<TransactionBloc>()
      ..add(InvoiceTransactionFetch(startDate: startDate, endDate: endDate))
      ..add(BalanceTransactionFetch())
      ..add(PaymentTransactionFetch(startDate: startDate, endDate: endDate));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Invoices & Payments',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const BalanceWidget(),
            Gap(16.h),
            Container(
              margin: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Invoices",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.push("/invoices").then((value) {
                          context.read<TransactionBloc>().add(
                              InvoiceTransactionFetch(
                                  startDate: '', endDate: ''));
                        });
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
            const InvoiceWidget(),
            Gap(16.h),
            Container(
              margin: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Payments",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.push("/payments").then((value) {
                          context.read<TransactionBloc>().add(
                              PaymentTransactionFetch(
                                  startDate: '', endDate: ''));
                        });
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
            const PaymentWidget(),
            Gap(16.h),
          ],
        ),
      ),
    );
  }
}
