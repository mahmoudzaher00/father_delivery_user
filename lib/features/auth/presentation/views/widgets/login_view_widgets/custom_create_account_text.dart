import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/routes_manager.dart';

class CustomCreateAccountText extends StatelessWidget {
  const CustomCreateAccountText({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 12.h,bottom: 12.h),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: 'ليس لديك حساب؟  ',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 15.sp,
                    color: ColorManager.hintTextColor
                )
            ),
            TextSpan(
                text: 'تسجيل جديد',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 15.sp,
                  color: ColorManager.primaryOrange,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorManager.primaryOrange,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {

                  Navigator.pushNamed(context, Routes.registerRoute);
                }),
          ])
      ),
    );
  }
}
