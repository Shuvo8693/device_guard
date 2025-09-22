
import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ---------- Today Used Apps ----------

class TodayUsedAppsSection extends StatelessWidget {
  const TodayUsedAppsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Today used apps',
              style: GoogleFontStyles.h5(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            Row(
              children: [
                Icon(Icons.chevron_left, size: 20.sp, color: Colors.grey[400]),
                Icon(Icons.chevron_right, size: 20.sp, color: Colors.grey[400]),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 80.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildAppIcon(Icons.facebook, Colors.blue),
              _buildAppIcon(Icons.camera_alt, Colors.purple),
              _buildAppIcon(Icons.message, Colors.blue),
              _buildAppIcon(Icons.camera, Colors.yellow),
              _buildAppIcon(Icons.grid_view, Colors.grey),
              _buildAppIcon(Icons.message, Colors.blue),
            ],
          ),
        ),
      ],
    );
  }

  /// private helper method
  Widget _buildAppIcon(IconData icon, Color color) {
    return Container(
      width: 60.w,
      height: 60.h,
      margin: EdgeInsets.only(right: 12.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(icon, color: Colors.white, size: 24.sp),
    );
  }
}