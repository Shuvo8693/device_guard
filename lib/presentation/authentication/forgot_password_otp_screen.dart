// Forgot Password OTP Screen
import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:device_guard/common/widgets/custom_button.dart';
import 'package:device_guard/common/widgets/custom_pin_field.dart';
import 'package:device_guard/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordOTPScreen extends StatefulWidget {
  const ForgotPasswordOTPScreen({super.key});

  @override
  State<ForgotPasswordOTPScreen> createState() => _ForgotPasswordOTPScreenState();
}

class _ForgotPasswordOTPScreenState extends State<ForgotPasswordOTPScreen> {
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'forget_password',
          style: GoogleFontStyles.h5(
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Text(
              'Forget password',
              style: GoogleFontStyles.h1(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Enter OTP',
              style: GoogleFontStyles.h5(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 40.h),
            CustomPinField(
              context: context,
              controller: _pinController,
              length: 6,
              activeFillColor: Colors.blue[50],
              borderRadius: 12.r,
              onCompleted: (pin) {

              },
            ),
            SizedBox(height: 24.h),
            CustomButton(
              text: 'Reset Password',
              onTap: () {
                // Handle reset password
              },
            ),
          ],
        ),
      ),
    );
  }
}

