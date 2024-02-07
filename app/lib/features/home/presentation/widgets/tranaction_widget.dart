import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/core/constants/assets.dart';
import 'package:tak/core/utils/colors.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            "Yesterday",
            style: GoogleFonts.robotoFlex(
              color: white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(8.h),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  topup,
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rent Due",
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.robotoFlex(
                        color: white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "Invoice",
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.robotoFlex(
                        color: white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "₦2,000,000.00",
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.end,
                  style: GoogleFonts.robotoFlex(
                    color: white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
