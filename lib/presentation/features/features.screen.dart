import 'package:device_guard/common/app_color/app_colors.dart';
import 'package:device_guard/presentation/profile/create_profile.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



// Screen 1: Feature Selection
class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Feature',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20.w,
                mainAxisSpacing: 20.h,
                childAspectRatio: 1.2,
                children: [
                  _buildFeatureCard(
                    icon: Icons.access_time,
                    title: 'Screentime',
                    onTap: () {},
                  ),
                  _buildFeatureCard(
                    icon: Icons.apps,
                    title: 'App Rule',
                    onTap: () {},
                  ),
                  _buildFeatureCard(
                    icon: Icons.schedule,
                    title: 'Schedule',
                    onTap: () {},
                  ),
                  _buildFeatureCard(
                    icon: Icons.bar_chart,
                    title: 'Report',
                    onTap: () {},
                  ),
                  _buildFeatureCard(
                    icon: Icons.video_library,
                    title: 'YouTube History',
                    color: Colors.red,
                    onTap: () {},
                  ),
                  _buildFeatureCard(
                    icon: Icons.music_note,
                    title: 'TikTok History',
                    color: Colors.black,
                    onTap: () {},
                  ),
                  _buildFeatureCard(
                    icon: Icons.screenshot,
                    title: 'Screen Capture',
                    color: Colors.green,
                    onTap: () {},
                  ),
                  _buildFeatureCard(
                    icon: Icons.web,
                    title: 'Website History',
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateProfileScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    Color? color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40.w,
              color: color ?? AppColors.primaryColor,
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


