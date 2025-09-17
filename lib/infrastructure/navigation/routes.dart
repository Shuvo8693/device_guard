class Routes {
  static Future<String> get initialRoute async {
    // TODO: implement method
    return SPLASH;
  }

  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const WELCOMELOGIN = '/welcome_login';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const EMAIL_VERIFICATION = '/email_verification';
  static const FORGOT_PASSWORD_EMAIL = '/forgot_password_email';
  static const FORGOT_PASSWORD_OTP = '/forgot_password_otp';
  static const RESET_PASSWORD = '/reset_password';
}
