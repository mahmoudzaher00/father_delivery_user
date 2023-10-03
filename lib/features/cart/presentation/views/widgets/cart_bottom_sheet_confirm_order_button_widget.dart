import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/routes_manager.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_elevated_button_widget.dart';

class CartBottomSheetConfirmOrderButtonWidget extends StatelessWidget {
  const CartBottomSheetConfirmOrderButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonWidget(
        onPressed: ()=>Navigator.pushReplacementNamed(context, Routes.trackOrderRoute,
        arguments: {
          'specialOrder':false,
        },
        ),
        width: SizeConfig.screenWidth!,
        buttonMargin: EdgeInsetsDirectional.only(start: 25.w,end: 20.w ,bottom: 15.h),
        child: Text(
            'تأكيد الطلب',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 18.sp, color: ColorManager.whiteColor)
        )
    );
  }
}