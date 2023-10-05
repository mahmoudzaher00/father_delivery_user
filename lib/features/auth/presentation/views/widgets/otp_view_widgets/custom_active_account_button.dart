import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/routes_manager.dart';
import '../../../../../../core/widgets/custom_elevated_button_widget.dart';

class CustomActiveAccountButton extends StatelessWidget {
  const CustomActiveAccountButton({super.key,});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonWidget(
      buttonMargin: EdgeInsetsDirectional.only( start: 20, bottom: 18.h,end: 10),
      onPressed: ()=> Navigator.pushNamed(context, Routes.activeAccountRoute),
      buttonText: 'تفعيل الحساب',
      buttonTextSize: 18.sp,
    );
      Container(
      height: 50,
      margin:  EdgeInsetsDirectional.only( start: 20, bottom: 18.h,end: 10),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient:  const LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            tileMode: TileMode.decal,
            colors: [
              Color(0xffEF554A),
              Color(0xffFF8C69),
            ],
          )),
      child: ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(context, Routes.activeAccountRoute);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: ColorManager.lightOrange,
              padding: EdgeInsets.zero
          ),
          child:  Text('تفعيل الحساب',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(color: ColorManager.whiteColor),)
      ),
    );
  }
}
