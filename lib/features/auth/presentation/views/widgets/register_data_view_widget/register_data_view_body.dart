import 'package:father_delivery_user/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app/di.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/widgets/custom_elevated_button_widget.dart';
import '../../../manager/registerDataCubit/register_data_cubit.dart';
import 'custom_email_text_field.dart';
import 'custom_register_data_image_widget.dart';
import 'custom_user_name_text_field.dart';

class RegisterDataViewBody extends StatelessWidget {
  const RegisterDataViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<RegisterDataCubit>(),
      child: ListView(
        padding:  EdgeInsets.symmetric(vertical: 40.h,horizontal: 20),
        children: [
          Text('أضف صورة شخصية',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp),),
          SizedBox(height: 20.h,),
          const CustomRegisterDataImageWidget(),
          SizedBox(height: 25.h,),
          Text('اسم المستخدم',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp),),
          SizedBox(height: 15.h,),
          const CustomUserNameTextField(),
          SizedBox(height: 25.h,),
          Text('البريد الإلكترونى',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp),),
          SizedBox(height: 15.h,),
          const CustomEmailTextField(),
          SizedBox(height: 40.h,),
          CustomElevatedButtonWidget(
            onPressed: ()=>Navigator.pushNamedAndRemoveUntil(context, Routes.homeRoute, (route) => false),
            child:  Text('تأكيد بياناتك',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp,color: ColorManager.whiteColor),), )

        ],
    ),
);
  }
}



