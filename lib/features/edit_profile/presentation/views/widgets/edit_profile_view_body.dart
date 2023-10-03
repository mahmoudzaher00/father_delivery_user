import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_edit_address_widget.dart';
import 'custom_edit_email_text_field.dart';
import 'custom_edit_name_text_field.dart';
import 'custom_edit_profile_image.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsetsDirectional.symmetric(vertical: 16.h,horizontal: 20),
      children: [
        SizedBox(height: 12.h,),
        const CustomEditProfileImage(),
        SizedBox(height: 20.h,),
        Text('تعديل اسم المستخدم',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp,color: ColorManager.hintTextColor),),
        SizedBox(height: 12.h,),
        const CustomEditNameTextField(),
        SizedBox(height: 16.h,),
        Text('تعديل البريد الإلكترونى',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp,color: ColorManager.hintTextColor),),
        SizedBox(height: 12.h,),
        const CustomEditEmailTextField(),
        SizedBox(height: 16.h,),
        Text('تعديل البريد الإلكترونى',style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp,color: ColorManager.hintTextColor),),
        SizedBox(height: 12.h,),
        const CustomEditAddressWidget()

      ],
    );
  }
}



