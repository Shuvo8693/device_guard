// Forgot Password Screen (Email Input)
import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:device_guard/common/widgets/custom_button.dart';
import 'package:device_guard/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  State<ForgotPasswordEmailScreen> createState() => _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  final TextEditingController _emailController = TextEditingController();

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
              'Please check email to verify',
              style: GoogleFontStyles.h5(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              'Email Address',
              style: GoogleFontStyles.h5(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              controller: _emailController,
              hintText: 'Enter your email',
            ),
            SizedBox(height: 24.h),
            CustomButton(
              text: 'Send code',
              onTap: () {
                // Handle send code
              },
            ),
          ],
        ),
      ),
    );
  }
}

