import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/core/constants/assets.dart';
import 'package:tak/core/domain/entities/tenant_house_entity.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/extensions.dart';

class HouseBannerWidget extends StatelessWidget {
  final TenantHouseEntity? tenantHouseEntity;
  const HouseBannerWidget({
    super.key,
    required this.tenantHouseEntity,
  });

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
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5.h),
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '${tenantHouseEntity?.status}'.inCaps,
                    style: GoogleFonts.robotoFlex(
                      color: white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  "${tenantHouseEntity?.house?.name}",
                  style: GoogleFonts.robotoFlex(
                    color: white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${tenantHouseEntity?.house?.houseNo}",
                  style: GoogleFonts.robotoFlex(
                    color: white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${tenantHouseEntity?.house?.furnitures}",
                  style: GoogleFonts.robotoFlex(
                    color: white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                tenantHouseEntity?.house?.description == null
                    ? Container()
                    : Text(
                        "${tenantHouseEntity?.house?.description}",
                        style: GoogleFonts.robotoFlex(
                          color: white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ],
            ),
          ),
          Image.asset(house),
        ],
      ),
    );
  }
}
