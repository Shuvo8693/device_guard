import 'package:device_guard/common/app_color/app_colors.dart';
import 'package:device_guard/common/app_images/app_svg.dart';
import 'package:device_guard/presentation/splash/controllers/splash.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin  {
  final splashController = Get.put(SplashController());
  late AnimationController _fadeController;
  late AnimationController _scaleController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this);
    _scaleController = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this);


    // Initialize animations
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));
    _startAnimations();
    splashController.routeNext();
  }

  void _startAnimations() async {
    // Start fade after 300ms
    await Future.delayed(const Duration(milliseconds: 300));
    _fadeController.forward();

    // Start scale after 500ms
    await Future.delayed(const Duration(milliseconds: 200));
    _scaleController.forward();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: AnimatedBuilder(
            animation: Listenable.merge([_fadeController,_scaleController]),
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                  opacity: _fadeController.value,
                child: Transform.scale(scale: _scaleController.value,
                child: SvgPicture.asset(AppSvg.fatherAndChildSvg),
                ),
              );
            },
           ),
      ),
    );
  }
}
