import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/features/service_request/domain/entities/service_requests_entity.dart';

class ServiceRequestCard extends StatelessWidget {
  final ServiceRequestsEntity request;

  const ServiceRequestCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      margin: EdgeInsets.only(right: 15.w),
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
            request.description,
            style: GoogleFonts.robotoFlex(
              color: white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Text(
                "Status: ",
                style: GoogleFonts.robotoFlex(
                  color: white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                request.status,
                style: GoogleFonts.robotoFlex(
                  color: white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Priority: ",
                style: GoogleFonts.robotoFlex(
                  color: white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                _getIconForPriority(request.priority),
                color: _getColorForPriority(request.priority),
              ),
            ],
          ),
          Flexible(
            child: Text(
              "Last Updated: ${convertDateToAgo(request.updatedAt)}",
              style: GoogleFonts.robotoFlex(
                color: white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getIconForPriority(priority) {
    switch (priority) {
      case "Low":
        return Icons.star_border;
      case "Medium":
        return Icons.star_half;
      case "High":
        return Icons.star;
      default:
        return Icons.star_border;
    }
  }

  Color _getColorForPriority(priority) {
    switch (priority) {
      case "Low":
        return Colors.grey;
      case "Medium":
        return Colors.orange;
      case "High":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
