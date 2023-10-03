import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import 'custom_add_review_for_meal_widget.dart';

class CustomMealRatingWidget extends StatelessWidget {
  const CustomMealRatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 10),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration:  BoxDecoration(
                  color: ColorManager.primaryGray,
                  boxShadow: ContainerManager.shadow,
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children:  [
                      const CustomImage(
                        image:ImageAssets.profileImage,
                        isAsset: true,
                        isShadow: false,
                        isCircular: true,
                        radiusCircleAvatar: 22,
                      ),
                      const SizedBox(width: 20,),
                      Text('فهد المولد',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp),),
                      const Spacer(),
                      RatingBarIndicator(
                        rating:3,
                        unratedColor: ColorManager.dividerColor,

                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: ColorManager.errorColor,
                        ),
                        itemCount: 5,
                        itemSize: 18.h,
                        direction: Axis.horizontal,
                        itemPadding: EdgeInsets.only(top: 7,left: 1.w,right: 1.w,bottom: 4),
                      ),

                    ],
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(start: 50),
                      width: SizeConfig.screenWidth!*.7,
                      child: Text('هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى',
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 11.sp,color: ColorManager.hintTextColor),
                      )
                  ),
                ],
              ),
            );
          },
        ),
        const CustomAddReviewForMealWidget()

      ],
    );
  }
}


