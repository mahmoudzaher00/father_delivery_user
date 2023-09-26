import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app/constants.dart';
import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_image_widget.dart';

class CustomOfferMealSliverAppBar extends StatelessWidget {
  const CustomOfferMealSliverAppBar({
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
      leading: FittedBox(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16, bottom: 0),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              elevation: 3,
              backgroundColor: ColorManager.whiteColor,
              foregroundColor: ColorManager.shadowColor,
              minimumSize: const Size(54, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
              color: ColorManager.primaryBlack,
            ),
          ),
        ),
      ),
      leadingWidth: 65,
      forceElevated: true,
      backgroundColor: ColorManager.primaryOrange,
      systemOverlayStyle: Constants.systemUiOverlayStyle,
      flexibleSpace: FlexibleSpaceBar(
        background: buildStackFlexibleSpaceBar(context),
      ),
    );
  }

  Widget buildStackFlexibleSpaceBar(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        CustomImage(
          ImageAssets.mealIngredients,
          isShadow: false,
          isNetwork: false,
          height: 340.h + SizeConfig.statusBarHeight!,
          fit: BoxFit.fill,
          width: SizeConfig.screenWidth!,
          borderRadius: BorderRadius.zero,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(top: 200.h, start: 8.w, end: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '25.00 رس',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: ColorManager.whiteColor,
                        fontSize: 16.sp,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: ColorManager.primaryOrange
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorManager.whiteColor),
                    child: Text('19.00 ر.س',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 16.sp,
                          color: ColorManager.primaryOrange),
                    ),
                  ),
                ],
              ),
              Container(
                height: 110.h,
                width: 110.h,
                padding:  const EdgeInsets.all(4),
                decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorManager.lightOrange,width: 2),
                    color: const Color(0xCBFFFFFF)
                ),
                child: DashedCircle(
                  color: ColorManager.lightOrange,
                  dashes: 16,
                  gapSize: 4,
                  child: Center(
                    child: Text(
                      '24%',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 28.sp,
                          color: ColorManager.primaryOrange),
                    ),
                  ),
                ),


                ),

            ],
          ),
        )
      ],
    );
  }
}
