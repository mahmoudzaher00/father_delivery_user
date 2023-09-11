import 'dart:io';
import 'package:father_delivery_user/core/app/extensions.dart';
import 'package:father_delivery_user/core/utils/toast_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';


import '../../../../core/app/di.dart';
import '../../../../core/core_cubit/generic_cubit/generic_cubit.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/utils/alert_dialog.dart';
import '../../../../core/utils/snak_bar_message.dart';
import '../manager/registerDataCubit/register_data_cubit.dart';
import '../manager/register_cubit/register_cubit.dart';

class AuthInputData{
  //TODO: Login Input Data & TextField Validation
  final loginPhoneController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  // GenericCubit<bool> visibleLoginPassword=GenericCubit<bool>(data: true);

  String? loginPhoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'LocaleKeys.pleasePhoneNumber.tr()';
    } else {
      return null;
    }
  }


//TODO: Register Input Data & TextField Validation
  File? selectedUserImage;
  bool userImageEmpty = true;
  final picker = ImagePicker();
  final registerUserNameController = TextEditingController();
  final registerPhoneController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final List<String> specialtyList = [
    'كهرباء',
    'سباكه',
    'حلول امنيه',
  ];

  // GenericCubit<bool> registerVisiblePassword=GenericCubit<bool>(data: true);

  String? registerUserNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'User name';
    } else {
      return null;
    }
  }

  String? registerPhoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'phone';
    } else {
      return null;
    }
  }

  String? registerEmailValidator(String? value) {
    if (value!.isEmpty) {
      return 'AppStrings.enterEmail.tr()';
    }
    else if(value.isValidEmail()){
      return 'AppStrings.pleaseEnterValidEmail.tr()';
    }else{
      return null;
    }

  }

  String? registerPasswordValidator(String? value) {
    if (value!.isEmpty) {
      return' AppStrings.pleaseEnterPassword.tr()';
    }else if(value.length<8){
      return 'AppStrings.passwordMustBeLeast8Chars.tr()';

    }
    else if (value.isValidPassword()){
      return 'AppStrings.passwordMustContainUpperLowerNumberSpecial.tr()';
    }
    else {
      return null;
    }
    }

  // TODO:Dialog to set, delete and change user image
  buildSetProfileImageAlertDialog(BuildContext context) {
    customAlertDialog(
        context: context,
        titleText: 'الصورة الشخصية',
        titleTextColor: ColorManager.primaryOrange,
        alertDialogHeight: 200,
        height: 0,
        customWidget: Column(
          children: [
            ListTile(
              onTap: ()=>instance<RegisterDataCubit>().openCamera(context),
              leading: const CircleAvatar(
                backgroundColor: ColorManager.extraLightOrange,
                child: Icon(CupertinoIcons.camera,color: ColorManager.primaryOrange,),
              ),
              title: Text('ارفع صورة من الكاميرا',style: Theme.of(context).textTheme.titleMedium,),

            ),
            const Divider(
              thickness: 1,
              color: ColorManager.dividerColor,
            ),

            ListTile(
              onTap: ()=>instance<RegisterDataCubit>().openGallery(context),
              leading:  CircleAvatar(
                backgroundColor: ColorManager.extraLightOrange,
                child:SvgPicture.asset(SvgAssets.iconGallery),
              ),
              title: Text('ارفع صورة من المعرض',style: Theme.of(context).textTheme.titleMedium,),

            ),
            const Divider(
              thickness: 1,
              color: ColorManager.dividerColor,
            ),
            ListTile(
              onTap: selectedUserImage!=null?()=> instance<RegisterDataCubit>().deleteTechnicalImage():(){
              showToast(message: 'message', state: ToastStates.error);
              },
              leading: const CircleAvatar(
                backgroundColor: ColorManager.extraLightOrange,
                child: Icon(CupertinoIcons.delete_simple,color: ColorManager.primaryOrange,),
              ),
              title: Text('حذف الصورة',style: Theme.of(context).textTheme.titleMedium,),

            ),
          ],
        )


    );
  }

  // TODO: New Password Input Data & TextField Validation
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  final GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();
  // GenericCubit<bool> visibleNewPassword=GenericCubit<bool>(data: true);
  // GenericCubit<bool> visibleConfirmNewPassword=GenericCubit<bool>(data: true);
  String? newPassWordValidator(String? value) {
    if (value!.isEmpty) {
      return 'برجاء إدخال كلمه المرور الجديدة';
    } else if(value.length<8) {
      return 'كلمه المرور يجب الا تقل عن ٨ ارقام';

    }else{
      return null;
    }
  }
  String? confirmNewPassWordValidator(String? value) {
    if (value!.isEmpty) {
      return 'برجاء إدخال تاكيد كلمه المرور';
    }
    else if(newPasswordController.text!=confirmNewPasswordController.text){
      return 'كلمة المرور غير متطابقه';
    }
    else {
      return null;
    }
  }

  }
