import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/container_manager.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class CustomAddReviewForMealWidget extends StatelessWidget {
  const CustomAddReviewForMealWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration:  BoxDecoration(
          color: ColorManager.primaryGray,
          boxShadow: ContainerManager.shadow,
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('تقييم التجربة',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 11.sp,color: ColorManager.hintTextColor),

              ),
              RatingBar.builder(
                  initialRating:0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  unratedColor: ColorManager.dividerColor,
                  itemSize: 15,
                  itemPadding: EdgeInsets.only(top: 7,left: 1.w,right: 1.w,bottom: 4),
                  itemBuilder: (context, _) =>
                  const Icon(
                    Icons.star, color: ColorManager.primaryOrange, size: 20,

                  ),
                  onRatingUpdate: (r) {

                  }
              )
            ],
          ),
          const SizedBox(height: 10,),
          CustomTextField(
            isShadow: false,
            hintText: 'أضف تعليقك ....',
            hintStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 11.sp,color: ColorManager.hintTextColor),
            fillColorTextFiled: ColorManager.whiteColor,
            filledColorTextFiled: true,
            enabledBorderRadius: 5,
            errorBorderRadius: 5,
            focusedErrorBorderRadius: 5,
            textInputAction: TextInputAction.send,


          ),
        ],
      ),
    );
  }
}