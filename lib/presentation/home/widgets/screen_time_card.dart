import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ---------- Screen Time Card ----------
class ScreenTimeCard extends StatelessWidget {
  const ScreenTimeCard({super.key});

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
              Icon(Icons.access_time, size: 20.sp, color: Colors.grey[600]),
              SizedBox(width: 8.w),
              Text(
                'Screen time',
                style: GoogleFontStyles.h5(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Text(
                'Last update today 10:45pm',
                style: GoogleFontStyles.h6(color: Colors.grey[500]),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              _buildTimeItem('40 min', Colors.red[400]!),
              SizedBox(width: 16.w),
              _buildTimeItem('40 min', Colors.grey[300]!),
              SizedBox(width: 16.w),
              _buildTimeItem('15 min', Colors.grey[300]!),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Text('Social media',
                  style: GoogleFontStyles.h6(color: Colors.grey[600])),
              SizedBox(width: 16.w),
              Text('Video games',
                  style: GoogleFontStyles.h6(color: Colors.grey[600])),
              SizedBox(width: 16.w),
              Text('Others',
                  style: GoogleFontStyles.h6(color: Colors.grey[600])),
            ],
          ),
        ],
      ),
    );
  }

  /// private helper method
  Widget _buildTimeItem(String time, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 4.h,
          width: 60.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          time,
          style: GoogleFontStyles.h6(
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}




