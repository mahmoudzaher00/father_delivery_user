import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class CustomEmailTextField extends StatelessWidget {
  const CustomEmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      isShadow: false,
      fillColorTextFiled: ColorManager.whiteColor,
      focusedBorderColor: ColorManager.borderColor,
      enabledBorderColor:ColorManager.borderColor ,
      hintText: 'Admin@example.com',
      hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 16.sp,color: ColorManager.borderColor),

    );
  }
}