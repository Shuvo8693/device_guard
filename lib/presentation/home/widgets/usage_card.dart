import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ---------- Usage Card ----------
class UsageCard extends StatelessWidget {
  final String title;
  final String duration;
  final String count;
  final Color color;
  final IconData icon;

  const UsageCard({
    Key? key,
    required this.title,
    required this.duration,
    required this.count,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(icon, color: Colors.white, size: 16.sp),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFontStyles.h6(
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, size: 16.sp, color: Colors.grey[400]),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            duration,
            style: GoogleFontStyles.h5(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            count,
            style: GoogleFontStyles.h6(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}