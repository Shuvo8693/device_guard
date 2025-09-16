import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:device_guard/presentation/authentication/widgets/login_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeLoginScreen extends StatelessWidget {
  const WelcomeLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),

              // Welcome Title
              Text(
                'Welcome!',
                style: GoogleFontStyles.h1(
                  fontWeight: FontWeight.w600,
                  fontSize: 32.sp,
                ),
              ),

              SizedBox(height: 8.h),

              // Subtitle
              Text(
                'Log in to your account',
                style: GoogleFontStyles.h5(
                  color: Colors.grey[600],
                  fontSize: 16.sp,
                ),
              ),

              SizedBox(height: 80.h),

              // Guardian Login Option
              LoginOptionWidget(
                icon: Icons.shield_outlined,
                iconColor: Colors.red,
                iconBackgroundColor: Colors.red.withOpacity(0.1),
                title: 'Guardian',
                onTap: () {
                  // Handle Guardian login
                  print('Guardian login tapped');
                },
              ),

              SizedBox(height: 16.h),

              // Children Login Option
              LoginOptionWidget(
                icon: Icons.child_care,
                iconColor: Colors.orange,
                iconBackgroundColor: Colors.orange.withOpacity(0.1),
                title: 'Children',
                onTap: () {
                  // Handle Children login
                  print('Children login tapped');
                },
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
