// Signup Screen
import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:device_guard/common/widgets/custom_button.dart';
import 'package:device_guard/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _agreeTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Signup',
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
              'Hello there!',
              style: GoogleFontStyles.h1(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Create your account',
              style: GoogleFontStyles.h5(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              'Full Name',
              style: GoogleFontStyles.h5(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              controller: _nameController,
              hintText: 'Enter your name',
            ),
            SizedBox(height: 20.h),
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
            SizedBox(height: 20.h),
            Text(
              'Password',
              style: GoogleFontStyles.h5(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              controller: _passwordController,
              hintText: 'Create a password',
              isPassword : true,
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Checkbox(
                  value: _agreeTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeTerms = value ?? false;
                    });
                  },
                  activeColor: Colors.blue[400],
                ),
                Expanded(
                  child: Text(
                    'I agree to the Terms and Privacy Policy',
                    style: GoogleFontStyles.h6(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            CustomButton(
              text: 'Sign Up',
              onTap: () {
                // Handle signup
              },
            ),
          ],
        ),
      ),
    );
  }
}

