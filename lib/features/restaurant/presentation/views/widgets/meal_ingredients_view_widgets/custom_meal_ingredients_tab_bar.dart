import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMealIngredientsTabBar extends StatelessWidget {
  const CustomMealIngredientsTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.primaryGray,
      child:  TabBar(
          labelPadding: const EdgeInsets.symmetric(vertical: 12),
          unselectedLabelColor: const Color(0xffB5B7B7),
          labelColor: ColorManager.primaryBlack,
          // indicatorColor: ColorManager.primaryOrange,
          indicatorWeight: 4,
          labelStyle: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15.sp),
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 12),
          indicator: const UnderlineTabIndicator(
             borderSide: BorderSide(color: ColorManager.primaryOrange,width: 3)
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          // dividerColor: Colors.red,
          tabs: const [
            Text('التقييمات'),
            Text('المكونات'),
      ]),
    );
  }
}