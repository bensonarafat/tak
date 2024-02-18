import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:tak/features/transactions/presentation/bloc/transaction_bloc.dart';
import 'package:tak/features/transactions/presentation/widgets/rent_balance_widget.dart';
import 'package:tak/features/transactions/presentation/widgets/service_balance_widget.dart';

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
          'Rent and Service Transactions',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RentBalanceWidget(),
            Gap(16.h),
            const ServiceBalanceWidget(),
            Gap(16.h),
          ],
        ),
      ),
    );
  }
}
