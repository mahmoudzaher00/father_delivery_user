import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:flutter/material.dart';

class TooltipWidget extends StatelessWidget {
  const TooltipWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p8),
      child: Tooltip(
          padding: const EdgeInsets.all(AppPadding.p20),
          showDuration: const Duration(seconds: 2),
          decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            boxShadow:ContainerManager.shadow,
            borderRadius: const BorderRadius.all(Radius.circular(4),
            ),
          ),
          textStyle:Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorManager.primaryOrange),
          verticalOffset: 20,
          message: "المصدر"
              "\n\n"
              "دجاج وجمبري وطنية",
          child: const Icon(Icons.info_rounded,size:18,color: ColorManager.gray200)
      ),
    );
  }
}