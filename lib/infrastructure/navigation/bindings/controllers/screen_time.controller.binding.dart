import 'package:get/get.dart';

import '../../../../presentation/screen_time/controllers/screen_time.controller.dart';

class ScreenTimeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenTimeController>(
      () => ScreenTimeController(),
    );
  }
}
