import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/app/di.dart';
import '../../../../core/core_cubit/generic_cubit/generic_cubit.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/utils/alert_dialog.dart';
import '../manager/new_order_cubit/new_order_cubit.dart';

class OrdersInputData{
  GenericCubit<int> timeCount=GenericCubit<int>(data: 1);

  List<File> imageList=[];
  bool userImageEmpty = true;
  final picker = ImagePicker();

  // TODO:Dialog to set, delete and change user image
  buildSelectImageAlertDialog(BuildContext context) {
    customAlertDialog(
        context: context,
        titleTextColor: ColorManager.primaryOrange,
        alertDialogHeight: 140,
        height: 0,
        customWidget: Column(

          children: [
            ListTile(
              onTap: ()=>instance<NewOrderCubit>().pikedCameraImages(context),
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
              onTap: ()=>instance<NewOrderCubit>().pikedGalleryImages(context),
              leading:  CircleAvatar(
                backgroundColor: ColorManager.extraLightOrange,
                child:SvgPicture.asset(SvgAssets.iconGallery),
              ),
              title: Text('ارفع صورة من المعرض',style: Theme.of(context).textTheme.titleMedium,),

            ),
          ],
        )


    );
  }
}