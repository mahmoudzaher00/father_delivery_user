import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';

class CustomFatherDeliveryRichTextWidget extends StatelessWidget {
  const CustomFatherDeliveryRichTextWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 12.h),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: 'Father  ',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 28.sp,
                    color: ColorManager.primaryOrange
                )
            ),
            TextSpan(
                text: 'Delivery',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 28.sp,
                    color: ColorManager.primaryBlack
                )
            ),
          ])
      ),
    );
  }
}
