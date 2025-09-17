import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:device_guard/common/widgets/custom_button.dart';
import 'package:device_guard/common/widgets/custom_text_field.dart';
import 'package:device_guard/common/widgets/have_an_account.dart';
import 'package:device_guard/common/widgets/spacing.dart';
import 'package:device_guard/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

// Login Screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Text(
                  'Welcome!',
                  style: GoogleFontStyles.h1(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Log in to your account',
                  style: GoogleFontStyles.h5(color: Colors.grey[600]),
                ),
                SizedBox(height: 40.h),
                Text(
                  'Email/Phone',
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
                  hintText: 'Enter your password',
                  isPassword: true,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                      activeColor: Colors.blue[400],
                    ),
                    Text(
                      'Remember me for 30 days',
                      style: GoogleFontStyles.h6(color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Navigate to forgot password
                      Get.toNamed(Routes.FORGOT_PASSWORD_EMAIL);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFontStyles.h6(color: Colors.blue[400]),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  text: 'Log In',
                  onTap: () {
                    // Handle login
                  },
                ),
                verticalSpacing(30.h),
                Align(
                  alignment: Alignment.center,
                  child: HaveAnAccountText(
                    normalText: "Don't have any account? ",
                    clickableText: "Sign up",
                    clickableTextStyle: GoogleFontStyles.h5(color: Colors.blue[400]),
                    onTap: () {
                      Get.toNamed(Routes.SIGNUP);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
