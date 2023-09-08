import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';

class CustomGoLoginText extends StatelessWidget {
  const CustomGoLoginText({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 12.h,bottom: 12.h),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: 'لديك حساب بالفعل؟  ',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 14.sp,
                    color: ColorManager.hintTextColor
                )
            ),
            TextSpan(
                text: 'تسجيل الدخول',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 14.sp,
                  color: ColorManager.primaryOrange,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorManager.primaryOrange,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {
                  Navigator.pop(context);
                }),
          ])
      ),
    );
  }
}
