import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/routes_manager.dart';
import '../../../../../../core/widgets/custom_elevated_button_widget.dart';

class CustomRegisterButton extends StatelessWidget {
  const CustomRegisterButton({super.key,});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonWidget(
      buttonMargin:EdgeInsetsDirectional.only(top: 40.h, start: 20, bottom: 22.h,end: 10),
      onPressed: ()=>  Navigator.pushNamed(context, Routes.otpRoute),
      buttonText: 'كود التفعيل',
      buttonTextSize: 18.sp,
    );
  }
}
