import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomSearchContainer extends StatelessWidget {
  final double? margin;
  final IconData icon;
  final Function()? onTap;
  final bool? hasFocus;
  final Widget? child;
  final Color? containerColor;
  const CustomSearchContainer({super.key,this.margin,required this.icon, this.onTap,this.hasFocus = false, this.child, this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s50,
      margin:  EdgeInsets.symmetric(horizontal: margin?? AppMargin.m18),
      width: SizeConfig.screenWidth! ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: ContainerManager.shadow,
        color:containerColor?? ColorManager.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: onTap,
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
              icon: Icon(icon,
                  color: hasFocus! ? ColorManager.blackColor : ColorManager.grayIcon
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
            child: VerticalDivider(
                width: AppSize.s1,
                color: hasFocus! ? ColorManager.blackColor : ColorManager.grayIcon
            ),
          ),
          child ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}