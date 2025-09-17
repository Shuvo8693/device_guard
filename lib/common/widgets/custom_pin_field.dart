import 'dart:async';

import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomPinField extends StatelessWidget {
  final BuildContext context;
  final TextEditingController controller;
  final int length;
  final Function(String)? onChanged;
  final Function(String)? onCompleted;
  final String? Function(String?)? validator;
  final StreamController<ErrorAnimationType>? errorAnimationController;
  final bool obscureText;
  final String obscuringCharacter;
  final Widget? obscuringWidget;
  final bool enableActiveFill;
  final Color? activeFillColor;
  final Color? inactiveFillColor;
  final Color? selectedFillColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? selectedColor;
  final Color? cursorColor;
  final double? fieldHeight;
  final double? fieldWidth;
  final double? borderRadius;
  final PinCodeFieldShape shape;
  final TextInputType keyboardType;
  final bool autoFocus;
  final Duration animationDuration;
  final AnimationType animationType;
  final TextStyle? textStyle;
  final TextStyle? pastedTextStyle;
  final bool Function(String?)? beforeTextPaste;
  final VoidCallback? onTap;
  final double? borderWidth;
  final EdgeInsetsGeometry? margin;

  const CustomPinField({
    super.key,
    required this.context,
    required this.controller,
    this.length = 6,
    this.onChanged,
    this.onCompleted,
    this.validator,
    this.errorAnimationController,
    this.obscureText = false,
    this.obscuringCharacter = '*',
    this.obscuringWidget,
    this.enableActiveFill = true,
    this.activeFillColor,
    this.inactiveFillColor,
    this.selectedFillColor,
    this.activeColor,
    this.inactiveColor,
    this.selectedColor,
    this.cursorColor,
    this.fieldHeight,
    this.fieldWidth,
    this.borderRadius,
    this.shape = PinCodeFieldShape.box,
    this.keyboardType = TextInputType.number,
    this.autoFocus = false,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationType = AnimationType.fade,
    this.textStyle,
    this.pastedTextStyle,
    this.beforeTextPaste,
    this.onTap,
    this.borderWidth,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 16.w),
      child: PinCodeTextField(
        appContext: context,
        controller: controller,
        length: length,
        obscureText: obscureText,
        obscuringCharacter: obscuringCharacter,
        obscuringWidget: obscuringWidget,
        blinkWhenObscuring: true,
        animationType: animationType,
        validator: validator,
        pinTheme: PinTheme(
          shape: shape,
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          fieldHeight: fieldHeight ?? 50.h,
          fieldWidth: fieldWidth ?? 45.w,
          borderWidth: borderWidth ?? 1.w,
          activeFillColor: activeFillColor ?? Colors.white,
          inactiveFillColor: inactiveFillColor ?? Colors.grey[50],
          selectedFillColor: selectedFillColor ?? Colors.white,
          activeColor: activeColor ?? Colors.blue[400],
          inactiveColor: inactiveColor ?? Colors.grey[300],
          selectedColor: selectedColor ?? Colors.blue[600],
        ),
        cursorColor: cursorColor ?? Colors.black,
        animationDuration: animationDuration,
        textStyle: textStyle ?? GoogleFontStyles.h4(
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
        backgroundColor: Colors.transparent,
        enableActiveFill: enableActiveFill,
        errorAnimationController: errorAnimationController,
        keyboardType: keyboardType,
        autoFocus: autoFocus,
        boxShadows: [
          BoxShadow(
            offset: Offset(0, 2.h),
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8.r,
          )
        ],
        onCompleted: onCompleted,
        onChanged: onChanged,
        beforeTextPaste: beforeTextPaste ?? (text) => true,
        onTap: onTap,
        pastedTextStyle: pastedTextStyle ?? TextStyle(
          color: Colors.green[600],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
