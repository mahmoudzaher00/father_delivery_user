import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.33,
      width: SizeConfig.screenWidth! * 0.7,
      child: DrawerHeader(
          decoration: const BoxDecoration(
            color: ColorManager.lightOrange,
            borderRadius: BorderRadius.zero,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomImage(
                ImageAssets.profileImage,
                isShadow: false,
                isNetwork: false,
              ),
              SizedBox(height: 20.h),
              Text('فهد المولد',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.whiteColor,
                  )
              ),
            ],
          )
      ),
    );
  }
}