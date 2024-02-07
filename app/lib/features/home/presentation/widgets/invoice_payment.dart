import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoicePayment extends StatelessWidget {
  const InvoicePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Invoices & Payments",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ],
    );
  }
}
