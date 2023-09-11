import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/routes_manager.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_elevated_button_widget.dart';

class CustomRecordDataButton extends StatelessWidget {
  const CustomRecordDataButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonWidget(
        width: SizeConfig.screenWidth!*.4,
        onPressed: ()=>Navigator.pushNamed(context, Routes.registerDataViewRoute),
        child: Text('سجل بياناتك',style: Theme.of(context).textTheme.displayLarge!.copyWith(color: ColorManager.whiteColor,fontSize: 16.sp),));
  }
}