import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DrawerCustomItem extends StatelessWidget {
  final String title;
  final double imageSize;
  final String? image;
  final bool isIcon;
  final IconData? icon;
  final Function() onPressed ;

  const DrawerCustomItem({super.key,
  required this.title,
  this.image,
  required this.onPressed,
  this.imageSize = AppSize.s20,
  this.isIcon=false,
  this.icon
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          foregroundColor: ColorManager.lightOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        padding: EdgeInsets.zero
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:AppPadding.p20,vertical:AppPadding.p16.h),
        child: Row(
          children: [
            isIcon?
            Icon(icon,color: ColorManager.primaryOrange,):
            SvgPicture.asset(image!,height: imageSize,width: imageSize),
            const SizedBox(width:AppSize.s20),
            Text(
              title,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: ColorManager.primaryOrange,
                  fontWeight: FontWeight.bold,fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}