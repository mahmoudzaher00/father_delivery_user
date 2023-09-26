import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final Color? buttonBackgroundColor;
  final Color? buttonSurfaceTintColor;
  final Color? buttonShadowColor;
  final Color? buttonForegroundColor;
  final Color? buttonBorderColor;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? buttonPadding;
  final EdgeInsetsGeometry? buttonMargin;
  final double? width;
  final double height;
  final double? buttonBorderWidth;
  final double? buttonElevation;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle? buttonStyleStyle;
  final bool buttonIsGradient;

  const CustomElevatedButtonWidget({
    Key? key,
    this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.gradient, this.buttonStyleStyle,
    this.buttonBackgroundColor,
    this.buttonSurfaceTintColor,
    this.buttonShadowColor,
    this.buttonForegroundColor, this.buttonPadding, this.buttonBorderColor,  this.buttonBorderWidth,  this.buttonElevation,  this.buttonIsGradient=true, this.buttonMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(5);
    return Container(
      width: width,
      height: height,
      margin: buttonMargin??EdgeInsets.zero,
      decoration:buttonIsGradient? BoxDecoration(
        gradient: gradient??const LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [Color(0xffEF554A), Color(0xffFF8C69),]),
        borderRadius: borderRadius,
      ):null,
      child: ElevatedButton(
        onPressed: onPressed??(){},
        style: buttonStyleStyle??ElevatedButton.styleFrom(
            backgroundColor: buttonBackgroundColor??Colors.transparent,
            surfaceTintColor:buttonSurfaceTintColor?? Colors.transparent,
            shadowColor: buttonShadowColor??Colors.transparent,
            foregroundColor: buttonForegroundColor??ColorManager.lightOrange,
            elevation: buttonElevation??0,
            padding: buttonPadding??EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
              side:  BorderSide(color: buttonBorderColor??Colors.transparent,width: buttonBorderWidth??1)
          ),

        ),
        child: child,
      ),
    );
  }
}