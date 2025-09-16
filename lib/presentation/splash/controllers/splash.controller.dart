import 'package:device_guard/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  }

  routeNext()async{
  await Future.delayed(Duration(seconds: 3)).then((v){
      Get.toNamed(Routes.WELCOMELOGIN);
    });
  }

}
