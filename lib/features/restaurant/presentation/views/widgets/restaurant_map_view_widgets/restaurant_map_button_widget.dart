import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/custom_elevated_button_widget.dart';

class RestaurantMapButton extends StatelessWidget {
  const RestaurantMapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonWidget(
        width: SizeConfig.screenWidth!,
        buttonMargin: EdgeInsetsDirectional.only(start: 25.w,end: 20.w ),
        child: Text(
            'اطلب',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 18.sp, color: ColorManager.whiteColor)
        )
    );
  }
}
