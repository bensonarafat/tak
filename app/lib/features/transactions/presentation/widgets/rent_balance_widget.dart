import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/core/constants/assets.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/features/transactions/presentation/bloc/transaction_bloc.dart';

class RentBalanceWidget extends StatelessWidget {
  const RentBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      buildWhen: (pre, state) {
        return state is BalanceTransactionLoaded;
      },
      builder: (context, state) {
        String amount = '0.00';
        if (state is BalanceTransactionLoaded) {
          amount = state.balanceEntity.rentTotal.toString();
        }
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 8.w, right: 8.w),
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff000000), Color(0xff434343)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.grey[200]!, blurRadius: 5)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rent Balance",
                style: GoogleFonts.robotoFlex(
                  color: white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(8.h),
              Row(
                children: [
                  Image.asset(
                    withdrawal,
                  ),
                  Gap(8.w),
                  Text(
                    "₦$amount",
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.robotoFlex(
                      color: white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
