import 'package:get/get.dart';

import '../../../../presentation/features/controllers/features.controller.dart';

class FeaturesControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeaturesController>(
      () => FeaturesController(),
    );
  }
}
