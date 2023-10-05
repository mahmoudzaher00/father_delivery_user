import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';

class CustomIngredientsOfMealWidget extends StatelessWidget {
  const CustomIngredientsOfMealWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> ingredientsList=[
      '5 قطع دجاج بروست',
      '1 باكت بطاطس مقلية',
      '1 خبز',
      '1 صوص تومية بارد',
      '1 صوص تومية حار'

    ];
    return ListView.builder(
      padding:  EdgeInsets.zero,
      itemCount: 1,
      shrinkWrap: true,
      itemBuilder:  (context, index)=> Container(
        margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        padding:const EdgeInsets.symmetric(horizontal: 2,vertical: 4),
        // height: 120,
        // width: 120,
        decoration: BoxDecoration(
            color: ColorManager.primaryGray,
            borderRadius: BorderRadius.circular(5)
        ),
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 10),
          itemCount: ingredientsList.length,
          itemBuilder:  (context, index) {
            return Padding(
              padding:  EdgeInsetsDirectional.only(bottom: 10.h,start: 20.w,top: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 15.h,
                    width: 15.h,
                    decoration: const BoxDecoration(
                        color: ColorManager.primaryOrange,
                        shape: BoxShape.circle
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Text(ingredientsList[index],style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp),)
                ],
              ),
            );

          },),
      ),
    );
  }
}