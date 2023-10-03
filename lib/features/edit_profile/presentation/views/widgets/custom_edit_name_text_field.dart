import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class CustomEditNameTextField extends StatelessWidget {
  const CustomEditNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'اسم المستخدم',
      hintTextSize: 14.sp,
      isShadow: false,
      inputTextSize: 16.sp,
      filledColorTextFiled: true,
      fillColorTextFiled: ColorManager.whiteColor,
      enabledBorderColor: ColorManager.borderColor,
      focusedBorderColor: ColorManager.borderColor,
    );
  }
}
