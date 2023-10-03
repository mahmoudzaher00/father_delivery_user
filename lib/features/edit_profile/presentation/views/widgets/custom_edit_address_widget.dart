import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/utils/size_config.dart';

class CustomEditAddressWidget extends StatelessWidget {
  const CustomEditAddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
      height: 45,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ColorManager.borderColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('حي البيان , الرياض',style: Theme.of(context).textTheme.displayLarge!.copyWith(color: ColorManager.primaryBlack,fontSize: 16.sp),),
          IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
              color: ColorManager.borderColor,
              icon:SvgPicture.asset(SvgAssets.locationIcon,height: 22,)),

        ],
      ),
    );
  }
}
