import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/container_manager.dart';
import '../utils/size_config.dart';
import 'custom_text_field.dart';

class CustomDiscountCodeWidget extends StatelessWidget {
  const CustomDiscountCodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: EdgeInsetsDirectional.only(top: 20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: ContainerManager.shadow,
          color: ColorManager.primaryGray),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'كود الخصم',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 14.sp, color: ColorManager.hintTextColor),
          ),
          CustomTextField(
            width: SizeConfig.screenWidth! * 0.6,
            isShadow: false,
            hintText: 'ادخل كود الخصم',
            filledColorTextFiled: true,
            fillColorTextFiled: ColorManager.whiteColor,
            focusedBorderColor: ColorManager.whiteColor,
            hintTextSize: 14.sp,
          ),
        ],
      ),
    );
  }
}
