import 'package:device_guard/presentation/authentication/controllers/login_controller.dart';
import 'package:get/get.dart';


class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
