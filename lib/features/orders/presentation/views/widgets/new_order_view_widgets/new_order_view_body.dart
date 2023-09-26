import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_text_field.dart';
import 'package:father_delivery_user/features/orders/presentation/manager/new_order_cubit/new_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_delivery_time_widget.dart';
import 'custom_location_order_widget.dart';
import 'custom_order_content_text_field.dart';
import 'custom_order_details_text_field.dart';
import 'custom_recipient_phone_text_field.dart';

class NewOrderViewBody extends StatelessWidget {
  const NewOrderViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => instance<NewOrderCubit>(),
  child: ListView(
      padding: EdgeInsetsDirectional.only(start: 20,end: 20,bottom: 10.h,top: 20.h),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: ContainerManager.shadow,
            color: ColorManager.primaryGray
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ما الذى تريد إرساله',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp),),
              SizedBox(height: 12.h,),
              const CustomOrderContentTextField(),
              SizedBox(height: 20.h,),
              const CustomDeliveryTimeWidget(),
              SizedBox(height: 12.h,),
              const Divider(
                color: ColorManager.whiteColor,
                thickness: 2,
              ),
              const CustomLocationOrderWidget(text: 'حدد موقع الإستلام',),
              SizedBox(height: 8.h,),
              const Divider(
                color: ColorManager.whiteColor,
                thickness: 2,
              ),
              const CustomLocationOrderWidget(text: 'حدد موقع التسليم',),
              SizedBox(height: 14.h,),
              const CustomRecipientPhoneTextField(),
              SizedBox(height: 14.h,),
              Text('ملاحظات إضافية',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp),),
              SizedBox(height: 12.h,),
              const CustomOrderDetailsTextField(),
              SizedBox(height: 12.h,),


            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
          margin: EdgeInsetsDirectional.only(top: 20.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: ContainerManager.shadow,
              color: ColorManager.primaryGray
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('كود الخصم',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp,color: ColorManager.borderColor),),

              CustomTextField(
                width: SizeConfig.screenWidth!*0.6,
                isShadow: false,
                hintText: 'ادخل كود الخصم',
                filledColorTextFiled:true,
                fillColorTextFiled:ColorManager.whiteColor,
                focusedBorderColor:ColorManager.whiteColor ,
                hintTextSize: 14.sp,
              ),


            ],
          ),
        ),
      ],
    ),
);
  }
}









