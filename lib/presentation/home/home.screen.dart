import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_guard/common/app_color/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFF7BB3E0),
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Icon(
              Icons.child_care,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
        ),
        title: Row(
          children: [
            Text(
              'Baby1',
              style: GoogleFontStyles.h4(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 20.sp,
            ),
          ],
        ),
        actions: [
          Container(
            width: 80.w,
            height: 120.h,
            margin: EdgeInsets.only(right: 16.w),
            decoration: BoxDecoration(
              color: const Color(0xFF7BB3E0),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildProfileItem('Baby1'),
                _buildProfileItem('Baby1'),
                _buildProfileItem('Baby1'),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionButton(
                    icon: Icons.phone_android,
                    label: 'Screentime',
                    onTap: () {},
                  ),
                  _buildActionButton(
                    icon: Icons.apps,
                    label: 'App Rule',
                    onTap: () {},
                  ),
                  _buildActionButton(
                    icon: Icons.schedule,
                    label: 'Schedule',
                    onTap: () {},
                  ),
                  _buildActionButton(
                    icon: Icons.assessment,
                    label: 'Report',
                    onTap: () {},
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // Screen Viewer and Browsing History Cards
              Row(
                children: [
                  Expanded(
                    child: _buildInfoCard(
                      icon: Icons.visibility,
                      iconColor: Colors.green,
                      title: 'Screen viewer',
                      subtitle: 'Screenshots',
                      count: '10',
                      description: 'Suspicious screenshot',
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _buildInfoCard(
                      icon: Icons.history,
                      iconColor: Colors.blue,
                      title: 'Browsing History',
                      subtitle: 'Websites searched',
                      count: '10',
                      description: 'Blocked website searched',
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // Screen Time Section
              _buildScreenTimeCard(),

              SizedBox(height: 24.h),

              // Today used apps
              _buildTodayUsedAppsSection(),

              SizedBox(height: 24.h),

              // App usage history
              _buildAppUsageHistory(),

              SizedBox(height: 20.h), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(String name) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 16.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.child_care,
              color: Colors.white,
              size: 10.sp,
            ),
          ),
          SizedBox(width: 4.w),
          Text(
            name,
            style: GoogleFontStyles.h6(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70.w,
        child: Column(
          children: [
            Container(
              width: 56.w,
              height: 56.h,
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
              child: Icon(
                icon,
                size: 24.sp,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: GoogleFontStyles.h6(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String count,
    required String description,
  }) {
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
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  icon,
                  size: 18.sp,
                  color: iconColor,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFontStyles.h5(
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 16.sp,
                color: Colors.grey[400],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            count,
            style: GoogleFontStyles.h4(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: GoogleFontStyles.h6(
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            description,
            style: GoogleFontStyles.h6(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScreenTimeCard() {
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
              Icon(
                Icons.access_time,
                size: 20.sp,
                color: Colors.grey[600],
              ),
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
                style: GoogleFontStyles.h6(
                  color: Colors.grey[500],
                ),
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
              Text(
                'Social media',
                style: GoogleFontStyles.h6(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(width: 16.w),
              Text(
                'Video games',
                style: GoogleFontStyles.h6(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(width: 16.w),
              Text(
                'Others',
                style: GoogleFontStyles.h6(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

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

  Widget _buildTodayUsedAppsSection() {
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
                Icon(
                  Icons.chevron_left,
                  size: 20.sp,
                  color: Colors.grey[400],
                ),
                Icon(
                  Icons.chevron_right,
                  size: 20.sp,
                  color: Colors.grey[400],
                ),
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

  Widget _buildAppIcon(IconData icon, Color color) {
    return Container(
      width: 60.w,
      height: 60.h,
      margin: EdgeInsets.only(right: 12.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 24.sp,
      ),
    );
  }

  Widget _buildAppUsageHistory() {
    return Row(
      children: [
        Expanded(
          child: _buildUsageCard(
            'YouTube app history',
            '50 minute',
            '2 videos',
            Colors.red,
            Icons.play_arrow,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _buildUsageCard(
            'TikTok app history',
            '50 minute',
            '2 videos',
            Colors.black,
            Icons.music_note,
          ),
        ),
      ],
    );
  }

  Widget _buildUsageCard(
      String title,
      String duration,
      String count,
      Color color,
      IconData icon,
      ) {
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
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 16.sp,
                ),
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
              Icon(
                Icons.chevron_right,
                size: 16.sp,
                color: Colors.grey[400],
              ),
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
            style: GoogleFontStyles.h6(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }


}