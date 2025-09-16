

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:device_guard/common/themes/light_theme.dart';

import 'common/app_constant/app_constant.dart';
import 'common/controller/theme_controller.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initialRoute = await Routes.initialRoute;
  Get.put(ThemeController());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_){
    runApp(MyApp(initialRoute: initialRoute));
  });
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ThemeController>(
        builder: (themeController) {
          return ScreenUtilInit(
              designSize: const Size(393, 852),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, child) {
                return GetMaterialApp(
                  title: AppConstants.APP_NAME,
                  debugShowCheckedModeBanner: false,
                  navigatorKey: Get.key,
                  theme: light(),
                  defaultTransition: Transition.topLevel,
                  transitionDuration: const Duration(milliseconds: 300),
                  initialRoute: initialRoute,
                  getPages: Nav.routes,
                );
              }
          );
        }
    );
  }
}