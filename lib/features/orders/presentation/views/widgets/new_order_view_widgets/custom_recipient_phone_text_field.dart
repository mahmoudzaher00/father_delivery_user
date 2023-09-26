import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class CustomRecipientPhoneTextField extends StatelessWidget {
  const CustomRecipientPhoneTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      width: SizeConfig.screenWidth,
      isShadow: false,
      hintText: 'أدخل رقم المستلم',
      filledColorTextFiled:true,
      fillColorTextFiled:ColorManager.whiteColor,
      focusedBorderColor:ColorManager.whiteColor ,
      hintTextSize: 14.sp,
    );
  }
}