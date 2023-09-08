import 'dart:io';
import 'package:father_delivery_user/core/app/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import '../../../../core/core_cubit/generic_cubit/generic_cubit.dart';

class AuthInputData{
  //TODO: Login Input Data & TextField Validation
  final loginPhoneController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GenericCubit<bool> visibleLoginPassword=GenericCubit<bool>(data: true);

  String? loginPhoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'LocaleKeys.pleasePhoneNumber.tr()';
    } else {
      return null;
    }
  }


//TODO: Register Input Data & TextField Validation
  String? selectedSpecialtyValue;
  File? technicalSelectedImage;
  bool technicalImageEmpty = true;
  final picker = ImagePicker();
  final registerFirstNameController = TextEditingController();
  final registerLastNameController = TextEditingController();
  final registerPhoneController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final List<String> specialtyList = [
    'كهرباء',
    'سباكه',
    'حلول امنيه',
  ];

  GenericCubit<bool> registerVisiblePassword=GenericCubit<bool>(data: true);

  String? registerFirstNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'first name';
    } else {
      return null;
    }
  }

  String? registerLastNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Last name';
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

  String? registerAgeValidator(String? value) {
    if (value!.isEmpty) {
      return 'AppStrings.enterEmail.tr()';
    }
    else{
      return null;
    }

  }

  String? registerBioValidator(String? value) {
    if (value!.isEmpty) {
      return 'AppStrings.enterEmail.tr()';
    }
    else{
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

  //TODO:Dialog to set, delete and change user image
  // buildEditProfileAlertDialog(BuildContext context) {
  //   customAlertDialog(
  //       context: context,
  //       titleText: 'الصورة الشخصية',
  //       alertDialogHeight: 260,
  //       height: 0,
  //       customWidget: Column(
  //         children: [
  //           ListTile(
  //             onTap: ()=>instance<RegisterCubit>().openCamera(context),
  //             leading: const CircleAvatar(
  //               backgroundColor: ColorManager.extraLightOrange,
  //               child: Icon(CupertinoIcons.camera,color: ColorManager.secondaryOrange,),
  //             ),
  //             title: Text('ارفع صورة من الكاميرا',style: Theme.of(context).textTheme.titleMedium,),
  //
  //           ),
  //           const Divider(
  //             thickness: 1,
  //             color: ColorManager.dividerColor,
  //           ),
  //           ListTile(
  //             onTap: ()=>instance<RegisterCubit>().openGallery(context),
  //             leading:  CircleAvatar(
  //               backgroundColor: ColorManager.extraLightOrange,
  //               child:SvgPicture.asset(SvgAssets.iconGallery),
  //             ),
  //             title: Text('ارفع صورة من المعرض',style: Theme.of(context).textTheme.titleMedium,),
  //
  //           ),
  //           const Divider(
  //             thickness: 1,
  //             color: ColorManager.dividerColor,
  //           ),
  //           ListTile(
  //             onTap: ()=> instance<RegisterCubit>().deleteTechnicalImage()
  //             ,
  //             leading: const CircleAvatar(
  //               backgroundColor: ColorManager.extraLightOrange,
  //               child: Icon(CupertinoIcons.delete_simple,color: ColorManager.secondaryOrange,),
  //             ),
  //             title: Text('حذف الصورة',style: Theme.of(context).textTheme.titleMedium,),
  //
  //           ),
  //         ],
  //       )
  //
  //
  //   );
  // }

  //TODO: New Password Input Data & TextField Validation
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  final GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();
  GenericCubit<bool> visibleNewPassword=GenericCubit<bool>(data: true);
  GenericCubit<bool> visibleConfirmNewPassword=GenericCubit<bool>(data: true);
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
