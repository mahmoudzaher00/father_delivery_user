import 'package:father_delivery_user/features/invoices/presentation/views/widgets/order_invoice_details_widget.dart';
import 'package:father_delivery_user/features/invoices/presentation/views/widgets/order_invoice_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/container_manager.dart';
import '../../../../../../core/widgets/custom_image_widget.dart';


class OrderInvoiceDetailsViewBody extends StatelessWidget {
  const OrderInvoiceDetailsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 16.h,horizontal:20.w),
      decoration: BoxDecoration(
          color: ColorManager.primaryGray,
          boxShadow: ContainerManager.shadow,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const CustomImage(
                  image:ImageAssets.baik,
                  radiusCircleAvatar: 30,
                  isAsset: true,
                  isCircular: true,
                  isShadow: false,
                ),
                const SizedBox(width: 20),
                Text('مطعم البيك',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 16.sp,
                  ),)
              ],
            ),
          ),
          const Divider(color: ColorManager.whiteColor,thickness: 2,),
          SizedBox(height: 12.h,),
          const OrderInvoiceDetailsWidget(),
          const Divider(color: ColorManager.whiteColor,thickness: 2,),
          const OrderInvoiceStateWidget(),
          const Divider(color: ColorManager.whiteColor,thickness: 2,),
          Padding(
            padding:  EdgeInsetsDirectional.only(start: 25.w,bottom:12.h,top: 12.h,end: 20.w ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('وجبة بروست 7 قطع',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 14.sp)),
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text:'  1*  ',
                              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  fontSize: 14.sp, color: ColorManager.borderColor)),
                          TextSpan(text: '30.00 ر.س',
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp)),
                        ]
                    )),
              ]),
          ),
          Padding(
            padding:  EdgeInsetsDirectional.only(start: 25.w,bottom:12.h,top: 12.h,end: 20.w ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('وجبة بروست 7 قطع - سبايسي',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 14.sp,
                  ),),
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text:'  1*  ',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontSize: 14.sp, color: ColorManager.borderColor)),
                          TextSpan(text: '30.00 ر.س',
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: 16.sp)),
                        ])
                ),
              ])
          ),
          const Divider(color: ColorManager.whiteColor,thickness: 2),
          Padding(
            padding:  EdgeInsetsDirectional.only(start: 25.w,bottom:10.h,top: 12.h,end: 20.w ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('المبلغ الإجمالى',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 16.sp,),
                ),
                Text(
                  '60.00 ر.س',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 18.sp, color: ColorManager.primaryOrange),
                )
              ]),
          )
        ]),
    );
  }
}
