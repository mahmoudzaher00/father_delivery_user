import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/routes_manager.dart';

class CustomSkipLoginButtonWidget extends StatelessWidget {
  const CustomSkipLoginButtonWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: ()=>Navigator.pushNamed(context, Routes.initialLocationMapRoute),
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.whiteColor,
                foregroundColor: ColorManager.gray200,
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Text(
              'تخطى التسجيل',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 16.sp),
            )
        ),
      ],
    );
  }
}
