import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import 'custom_offer_items_list_view.dart';
import 'custom_offer_meal_sliver_app_bar.dart';

class OfferMealViewBody extends StatelessWidget {
  const OfferMealViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder:  (context, innerBoxIsScrolled) => [
        const CustomOfferMealSliverAppBar()
        ],
        body:Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // height: 120,
              margin: EdgeInsets.symmetric(vertical: 20.h,),
              padding: EdgeInsetsDirectional.only(start: 16,top: 15.h,bottom: 15.h),
              width: SizeConfig.screenWidth!-40.w,
              decoration: BoxDecoration(
                color: ColorManager.primaryGray,
                borderRadius: BorderRadius.circular(5),
                boxShadow: ContainerManager.shadow
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('مكونات العرض',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20.sp),),
                  const CustomOfferItemsListView(),
                ],
              ),
            ),
          ],
        )
    );
  }
}




