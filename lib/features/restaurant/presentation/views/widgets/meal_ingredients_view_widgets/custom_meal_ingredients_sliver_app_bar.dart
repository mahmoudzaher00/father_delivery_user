import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app/constants.dart';
import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_image_widget.dart';
import 'custom_meal_ingredients_tab_bar.dart';

class CustomMealIngredientsSliverAppBar extends StatelessWidget {
  const CustomMealIngredientsSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 4,
      pinned: true,
      toolbarHeight: 50,
      expandedHeight: 340.h,
      centerTitle: true,
      leadingWidth: 65,
      forceElevated: true,
      backgroundColor: ColorManager.primaryOrange,
      systemOverlayStyle: Constants.systemUiOverlayStyle,
      flexibleSpace: FlexibleSpaceBar(
        background: buildStackFlexibleSpaceBar(context),
      ),
      bottom: buildBottomPreferredSize(),

    );
  }

  PreferredSize buildBottomPreferredSize() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(90.0),
      child: CustomMealIngredientsTabBar(),
      // child: CustomRestaurantTabBar(),
    );
  }

  Widget buildStackFlexibleSpaceBar(BuildContext context) {
    return Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          CustomImage(
            image:ImageAssets.mealIngredients,
            isShadow: false,
            isNetwork: false,
            height: 340.h + SizeConfig.statusBarHeight!,
            fit: BoxFit.fill,
            width: SizeConfig.screenWidth!,
            borderRadius: BorderRadius.zero,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(top: 200.h, start: 8.w, end: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'بروست 5 قطع',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: ColorManager.whiteColor,
                      fontSize: 14),
                ),
                SizedBox(height: 14.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffCCCCCC)),
                      child: Row(
                        children: [
                          Text(
                            '19.00 ر.س',
                            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                fontSize: 14,
                                color: ColorManager.primaryOrange),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffCCCCCC)),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: ColorManager.primaryOrange,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            '3.6',
                            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 12.sp,
                                color: ColorManager.primaryOrange),
                          ),
                          const SizedBox(width: 3,),
                          Text(
                            '(19.00 تقيم)',
                            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 10.sp,
                                color: ColorManager.hintTextColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );
  }
}

