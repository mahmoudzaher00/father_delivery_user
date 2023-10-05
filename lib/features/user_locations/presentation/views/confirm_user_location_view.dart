import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_app_bar_widget.dart';
import 'package:father_delivery_user/core/widgets/custom_map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_elevated_button_widget.dart';

class ConfirmUserLocationMapView extends StatelessWidget{
  const ConfirmUserLocationMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        //Navigator.pushReplacementNamed(context, Routes.restaurantRoute);
        return true;
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomMapWidget(
              mapHeight: SizeConfig.screenHeight,
              getMyLocation: false,
              borderRadius: BorderRadius.zero,
              showMarker: true,
            ),
            Positioned(
              top: AppSize.s0, right: AppSize.s0, left: AppSize.s0,
              child: SafeArea(
                child: SizedBox(
                  height:AppSize.s60,
                  child: CustomAppBar(
                    appBarToolbarHeight: AppSize.s60,
                    appBarBackgroundColor: ColorManager.transparentColor,
                    titleContent: const Text(""),
                  ),
                ),
              ),
            ),
            CustomElevatedButtonWidget(
                width: SizeConfig.screenWidth!,
                onPressed: ()=> Navigator.pop(context),
                buttonMargin: EdgeInsetsDirectional.only(start: 25.w,end: 20.w,bottom: 25.h),
                child: Text(
                    'تأكيد موقع الإستلام',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 18.sp, color: ColorManager.whiteColor)
                )
            )
          ],
        ),
      ),
    );
  }
}
