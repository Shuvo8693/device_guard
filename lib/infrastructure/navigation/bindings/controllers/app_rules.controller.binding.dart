import 'package:get/get.dart';

import '../../../../presentation/app_rules/controllers/app_rules.controller.dart';

class AppRulesControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppRulesController>(
      () => AppRulesController(),
    );
  }
}
