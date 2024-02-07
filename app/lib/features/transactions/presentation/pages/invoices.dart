import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tak/core/constants/assets.dart';
import 'package:tak/features/home/presentation/widgets/transaction_widget_debit.dart';

class Invoices extends StatefulWidget {
  const Invoices({super.key});

  @override
  State<Invoices> createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> {
  List<dynamic> transations = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Invoices',
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
                    'No Invoice Available',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16.h),
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Row(
                                children: [
                                  HeroIcon(HeroIcons.magnifyingGlass),
                                  Text("Search"),
                                ],
                              ),
                              counterText: '',
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 8.w, right: 8.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              border: Border.all(
                                color: const Color.fromARGB(255, 184, 180, 180),
                              ),
                            ),
                            padding: EdgeInsets.all(8.w),
                            child: const HeroIcon(HeroIcons.funnel),
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
                ],
              ),
            ),
    );
  }
}
