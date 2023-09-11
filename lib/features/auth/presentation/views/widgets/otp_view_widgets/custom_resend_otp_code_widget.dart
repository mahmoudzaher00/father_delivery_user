import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';

class CustomResendOtpCodeWidget extends StatelessWidget {
  const CustomResendOtpCodeWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: 10.h, start: 16, bottom: 18.h),
        child: TextButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              foregroundColor: ColorManager.gray200),
          child: Text(
            'ارسال الكود مرة أخرى',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 14.sp,
                  color: ColorManager.hintTextColor,
                ),
          ),
        ),
      ),
    );
  }
}
