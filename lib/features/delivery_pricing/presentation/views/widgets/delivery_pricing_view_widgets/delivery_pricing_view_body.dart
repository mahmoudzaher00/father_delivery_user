import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/container_manager.dart';
import '../../../../../../core/widgets/custom_discount_code_widget.dart';
import '../../../../../../core/widgets/custom_location_order_widget.dart';
import 'custom_delivery_hours_widget.dart';

class DeliveryPricingViewBody extends StatelessWidget {
  const DeliveryPricingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 10.h, top: 20.h),
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
                color: ColorManager.primaryGray,
                boxShadow: ContainerManager.shadow,
                borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('تسعيرة التوصيل',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 16.sp,
                  ),),
              ),
              SizedBox(height: 20.h,),
              const Divider(color: ColorManager.whiteColor,thickness: 2,),
              const CustomDeliveryHoursWidget(),
              const Divider(color: ColorManager.whiteColor,thickness: 2,),
              Padding(
                padding: EdgeInsets.only(left: 20,right: 20,bottom: 12.h),
                child: const CustomLocationOrderWidget(text: 'حدد موقع الإستلام',),
              ),
              const Divider(color: ColorManager.whiteColor,thickness: 2,),
              Padding(
                padding: EdgeInsets.only(left: 20,right: 20,bottom: 12.h),
                child: const CustomLocationOrderWidget(text: 'حدد موقع التسليم',),
              ),
            ],
          ),
        ),
        const CustomDiscountCodeWidget(),
      ],
    );
  }
}


