import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/features/delivery_pricing/presentation/views/delivery_pricing_input_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/container_manager.dart';

import 'custom_delivery_destination_widget.dart';

class DeliveryPricingDetailsViewBody extends StatelessWidget {
  const DeliveryPricingDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return  Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      margin:  EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 10.h, top: 20.h),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('وقت الوصول / ساعة',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 16.sp,
                  ),),
                Text('${instance<DeliveryPricingInputData>().hoursCount.state.data} ساعة ',  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 14.sp,
                )),
              ],
            ),
          ),
          const Divider(color: ColorManager.whiteColor,thickness: 2,),
          const CustomDeliveryDestinationWidget(
            fromToText: 'من',
            destinationText: 'حى البيان , الرياض',
          ),
          const Divider(color: ColorManager.whiteColor,thickness: 2,),
          const CustomDeliveryDestinationWidget(
            fromToText: 'إلى',
            destinationText: 'حى غرناطة , الدمام',
          ),
          const Divider(color: ColorManager.whiteColor,thickness: 2,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('المسافة',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 16.sp,
                  ),),
                Text('400 Km',  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 14.sp,
                )),
              ],
            ),
          ),
          const Divider(color: ColorManager.whiteColor,thickness: 2,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('سعر التوصيل',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 14.sp,
                  ),),
                Text('500.00 ر.س',  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 14.sp,
                )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10.h),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('خصم الكوبون',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 14.sp,
                  ),),
                Text('  (10%)  ',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 14.sp,
                    color: ColorManager.borderColor,
                  ),),
                const Spacer(),

                Text('50.00 ر.س',  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 14.sp,
                )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('السعر بعد الخصم',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 16.sp,
                  ),),
                Text('450.00 رس',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 16.sp,color: ColorManager.primaryOrange
                )),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

