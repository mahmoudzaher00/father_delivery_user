import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/color_manager.dart';

class CustomLocationOrderWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomLocationOrderWidget({super.key, required this.text, this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16.sp,color: ColorManager.borderColor),
        ),
        IconButton(
            onPressed: onPressed??() {},
            padding: EdgeInsets.zero,
            tooltip: text.replaceAll('حدد', ''),
            visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
            color: ColorManager.borderColor,
            icon:SvgPicture.asset(SvgAssets.locationIcon,height: 22,)),
      ],
    );
  }
}