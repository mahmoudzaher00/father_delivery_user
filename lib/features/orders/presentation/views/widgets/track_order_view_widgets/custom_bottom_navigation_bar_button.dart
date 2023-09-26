import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_elevated_button_widget.dart';

class CustomBottomNavigationBarButton extends StatelessWidget {
  const CustomBottomNavigationBarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonWidget(
        width: SizeConfig.screenWidth!,
        buttonMargin: EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 12.h),
        child: Text(
          'تأكيد الطلب',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 18.sp,
              color: ColorManager.whiteColor

          ),
        ));
  }
}