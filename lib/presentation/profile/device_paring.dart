// Screen 4: Device Pairing Screen
import 'package:device_guard/common/app_color/app_colors.dart';
import 'package:device_guard/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DevicePairingScreen extends StatelessWidget {
  const DevicePairingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Create profile',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300.w,
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Device illustration
              Container(
                width: 120.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Stack(
                  children: [
                    // Phone
                    Positioned(
                      left: 20.w,
                      top: 15.h,
                      child: Container(
                        width: 40.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 8.h),
                            Container(
                              width: 24.w,
                              height: 2.h,
                              color: Colors.white,
                            ),
                            SizedBox(height: 4.h),
                            Container(
                              width: 24.w,
                              height: 30.h,
                              color: Colors.white,
                            ),
                            const Spacer(),
                            Container(
                              width: 20.w,
                              height: 3.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                            SizedBox(height: 4.h),
                          ],
                        ),
                      ),
                    ),
                    // Laptop/Tablet
                    Positioned(
                      right: 15.w,
                      top: 25.h,
                      child: Container(
                        width: 50.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(3.w),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Connection dots
                    Positioned(
                      left: 35.w,
                      top: 35.h,
                      child: Row(
                        children: [
                          ...List.generate(5, (index) => Container(
                            width: 4.w,
                            height: 4.w,
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: const BoxDecoration(
                              color: AppColors.grey,
                              shape: BoxShape.circle,
                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Enter the code to pair device',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code_2,
                    size: 20.w,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Pair code',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                '12345678',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  letterSpacing: 4.0,
                ),
              ),
              SizedBox(height: 24.h),
              CustomButton(
                text: 'Send download link',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Download link sent!')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
