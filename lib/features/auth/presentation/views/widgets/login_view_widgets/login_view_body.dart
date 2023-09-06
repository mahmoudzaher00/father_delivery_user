import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/widgets/custom_gradient_widget.dart';
import '../custom_auth_top_shape_widget.dart';
import '../custom_father_delivery_rich_text_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children:  [
        const CustomStackedTopShapeWidget(),
        const CustomFatherDeliveryRichTextWidget(),
        Padding(
          padding:  EdgeInsetsDirectional.only(top: 20.h,start: 20),
          child: Text('تسجيل الدخول',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20),),
        ),
        Padding(
          padding:  EdgeInsetsDirectional.only(top: 10.h,start: 20,bottom: 22.h),
          child: Text('أدخل رقم الهاتف المسجل في حسابك',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14,color: ColorManager.hintTextColor),),
        ),
        Padding(
          padding:  const EdgeInsetsDirectional.only(start: 20,end: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextField(
                width: SizeConfig.screenWidth!*.6,
                hintText: '508  xxx  xxx',
              ),
              Container(
                height: 50,
                width: SizeConfig.screenWidth!*.3,
                decoration: BoxDecoration(
                  color: ColorManager.primaryGray,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow:ContainerManager.shadow
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('+966',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 20),),
                    SvgPicture.asset(SvgAssets.saudiFlag,),

                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin:   EdgeInsetsDirectional.only(start: 20.0,end: 10,top: 30.h,bottom: 40.h),
          padding: EdgeInsets.zero,
          height: 50,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: const LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              tileMode: TileMode.decal,
              colors: [
                Color(0xffEF554A),
                Color(0xffFF8C69),
              ],
            )
            ),
          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,

              surfaceTintColor:  Colors.transparent,
              shadowColor:  Colors.transparent,
              foregroundColor: ColorManager.extraLightOrange
              // shape:
            ),
            child: Text('دخول',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20,color: ColorManager.whiteColor)),
          ),
        ),
      ],
    );
  }
}


