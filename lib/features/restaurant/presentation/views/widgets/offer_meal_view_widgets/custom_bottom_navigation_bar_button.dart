import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/custom_elevated_button_widget.dart';

class CustomBottomNavigationBarButton extends StatelessWidget {
  const CustomBottomNavigationBarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 12),
      child: CustomElevatedButtonWidget(
        child: Text('اطلب',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20.sp,color: ColorManager.whiteColor),),

      ),
    );
  }
}