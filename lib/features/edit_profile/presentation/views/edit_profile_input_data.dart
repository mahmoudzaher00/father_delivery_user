import 'dart:io';

import 'package:father_delivery_user/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/app/di.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/utils/alert_dialog.dart';

class EditProfileInputData{
  File? selectedUserImage;
  bool userImageEmpty = true;
  final picker = ImagePicker();
  // TODO:Dialog to set, delete and change user image
  buildEditProfileImageAlertDialog(BuildContext context) {
    customAlertDialog(
        context: context,
        titleTextColor: ColorManager.primaryOrange,
        alertDialogHeight: 200,
        height: 0,
        customWidget: Column(
          children: [
            ListTile(
              onTap: ()=>instance<EditProfileCubit>().openCamera(context),
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
              onTap: ()=>instance<EditProfileCubit>().openGallery(context),
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
              onTap:(){
                instance<EditProfileCubit>().deleteProfileImage();
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
}