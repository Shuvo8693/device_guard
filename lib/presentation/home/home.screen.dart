import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:device_guard/presentation/app_rules/app_rules.screen.dart';
import 'package:device_guard/presentation/home/widgets/features.dart';
import 'package:device_guard/presentation/home/widgets/info_card.dart';
import 'package:device_guard/presentation/home/widgets/screen_time_card.dart';
import 'package:device_guard/presentation/home/widgets/today_used_app_section.dart';
import 'package:device_guard/presentation/home/widgets/usage_card.dart';
import 'package:device_guard/presentation/screen_time/screen_time.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_guard/common/app_color/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main action buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Features(
                      icon: Icons.phone_android,
                      label: 'Screentime',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenTimeScreen(),
                          ),
                        );
                      },
                    ),
                    Features(
                      icon: Icons.apps,
                      label: 'App Rule',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AppRulesScreen(),
                          ),
                        );
                      },
                    ),
                    Features(
                      icon: Icons.schedule,
                      label: 'Schedule',
                      onTap: () {},
                    ),
                    Features(
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
                      child: InfoCard(
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
                      child: InfoCard(
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
                ScreenTimeCard(),

                SizedBox(height: 24.h),

                // Today used apps
                TodayUsedAppsSection(),

                SizedBox(height: 24.h),

                // App usage history
                _buildAppUsageHistory(),

                SizedBox(height: 20.h), // Bottom padding
              ],
            ),
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



  Widget _buildAppUsageHistory() {
    return Row(
      children: [
        Expanded(
          child: UsageCard(
           title:  'YouTube app history',
           duration:  '50 minute',
           count:  '2 videos',
           color:  Colors.red,
           icon:  Icons.play_arrow,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: UsageCard(
            title:  'TikTok app history',
            duration:'50 minute',
            count: '2 videos',
            color:  Colors.black,
            icon: Icons.music_note,
          ),
        ),
      ],
    );
  }


}