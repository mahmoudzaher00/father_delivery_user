import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_elevated_button_widget.dart';

class CustomEditProfileBottomNavigationBar extends StatelessWidget {
  const CustomEditProfileBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomElevatedButtonWidget(
            width: SizeConfig.screenWidth!*.42,
            child: Text('حفظ',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp,color: ColorManager.whiteColor),),

          ),
          CustomElevatedButtonWidget(
            buttonIsGradient: false,
            width: SizeConfig.screenWidth!*.42,
            buttonBorderColor: ColorManager.primaryOrange,
            buttonBackgroundColor: ColorManager.whiteColor,


            child: Text('إلغاء',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp,color: ColorManager.primaryOrange),),

          ),
        ],
      ),
    );
  }
}
