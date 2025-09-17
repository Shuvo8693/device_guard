// Reset Password Screen
import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:device_guard/common/widgets/custom_button.dart';
import 'package:device_guard/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../infrastructure/navigation/routes.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Text(
                'Reset password',
                style: GoogleFontStyles.h1(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Reset with your new password',
                style: GoogleFontStyles.h5(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'New Password',
                style: GoogleFontStyles.h5(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: _newPasswordController,
                hintText: 'Enter new password',
                isPassword: true,
              ),
              SizedBox(height: 20.h),
              Text(
                'Confirm password',
                style: GoogleFontStyles.h5(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: _confirmPasswordController,
                hintText: 'Confirm password',
                isPassword: true,
              ),
              SizedBox(height: 40.h),
              CustomButton(
                text: 'Change Password',
                onTap: () {
                  // Handle password change
                  Get.offAllNamed(Routes.LOGIN);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}