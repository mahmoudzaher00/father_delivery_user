import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/features/home/presentation/views/widgets/drawer_widgets/drawer_custom_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/routes_manager.dart';
import 'drawer_widgets/drawer_header.dart';
import 'drawer_widgets/lang_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: SizeConfig.screenWidth! * 0.7,
      elevation: AppSize.s10,
      shadowColor: ColorManager.gray400,
      child: Container(
        color: ColorManager.whiteColor,
        child: Column(
          children: [
            const DrawerHeaderWidget(),
            DrawerCustomItem(title: "تعديل بياناتي", image: SvgAssets.settings, onPressed: (){}),
            DrawerCustomItem(title: 'طلباتي', image: SvgAssets.creditCard, imageSize: AppSize.s16, onPressed: (){
              Navigator.pushNamed(context, Routes.myOrdersViewRoute);
            }),
            DrawerCustomItem(title: 'الفواتير', imageSize: AppSize.s16, image: SvgAssets.money,onPressed: (){
              Navigator.pushNamed(context, Routes.orderInvoicesViewRoute);
            }),
            DrawerCustomItem(title: 'التسعيرات',image: SvgAssets.pricing,onPressed: (){}),
            DrawerCustomItem(title: 'الشروط والأحكام',image: SvgAssets.termsIcon,onPressed: (){
              Navigator.pushNamed(context, Routes.termsAndConditionsRoute);
            }),
            DrawerCustomItem(title: 'تواصل معنا',image: SvgAssets.contactUsIcon,onPressed: (){
              Navigator.pushNamed(context, Routes.contactUsRoute);
            }),
            const Spacer(),
            const LangWidget(),
            SizedBox(height: 30.h),
            InkWell(
                onTap: (){},
                child: Text("تسجيل الخروج", style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 14))
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}





