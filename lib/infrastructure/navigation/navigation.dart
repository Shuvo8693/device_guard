import 'package:device_guard/presentation/authentication/email_verification_screen.dart';
import 'package:device_guard/presentation/authentication/forgot_password_email_screen.dart';
import 'package:device_guard/presentation/authentication/forgot_password_otp_screen.dart';
import 'package:device_guard/presentation/authentication/login.screen.dart';
import 'package:device_guard/presentation/authentication/reset_password_screen.dart';
import 'package:device_guard/presentation/authentication/signup.screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashControllerBinding(),
    ),
    GetPage(
      name: Routes.WELCOMELOGIN,
      page: () => const WelcomeLoginScreen(),
      binding: AuthenticationControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: AuthenticationControllerBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupScreen(),
      binding: AuthenticationControllerBinding(),
    ),
    GetPage(
      name: Routes.EMAIL_VERIFICATION,
      page: () => const EmailVerificationScreen(),
      binding: AuthenticationControllerBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD_EMAIL,
      page: () => const ForgotPasswordEmailScreen(),
      binding: AuthenticationControllerBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD_OTP,
      page: () => const ForgotPasswordOTPScreen(),
      binding: AuthenticationControllerBinding(),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => const ResetPasswordScreen(),
      binding: AuthenticationControllerBinding(),
    ),
  ];
}
