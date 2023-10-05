import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/alert_dialog.dart';

class TooltipWidget extends StatelessWidget {
  const TooltipWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){buildCustomAlertDialog(context);},
      padding: EdgeInsets.zero,
      visualDensity: const VisualDensity(horizontal: -4,vertical: -4),
      icon: const Icon(Icons.info_rounded,size:18,color: ColorManager.gray200),);
  }

  buildCustomAlertDialog(BuildContext context) {
    return customAlertDialog(
      context: context, 
      alertDialogHeight: 100,
      height: 0,
      dialogAlignment: Alignment.bottomCenter,
        dialogShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
      dialogContentPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
      dialogInsetsPadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
      contentTextWidget: Column(
        children: [
          Text('المصدر',style: Theme.of(context).textTheme.displayLarge!.copyWith(color: ColorManager.primaryOrange,fontSize: 16.sp),),
          const SizedBox(height: 5,),
          SizedBox(
            width: SizeConfig.screenWidth!*.4,
              child: const Divider(color: ColorManager.lightGray1,thickness: 2,)),
          const SizedBox(height: 10,),
          RichText(text: TextSpan(
            children: [
              TextSpan(
                text: 'دجاج وجمبري  ',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp),),
              TextSpan(text: 'وطنية',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(color: ColorManager.primaryOrange,fontSize: 16.sp),),
            ]
          ))

        ],
      )

      

    );
  }
}
// Tooltip(
//     padding: const EdgeInsets.all(AppPadding.p20),
//     showDuration: const Duration(seconds: 2),
//     decoration: BoxDecoration(
//       color: ColorManager.whiteColor,
//       boxShadow:ContainerManager.shadow,
//       borderRadius: const BorderRadius.all(Radius.circular(4),
//       ),
//     ),
//     textStyle:Theme.of(context).textTheme.displaySmall!.copyWith(color: ColorManager.primaryOrange),
//     verticalOffset: 20,
//     message: "المصدر"
//         "\n\n"
//         "دجاج وجمبري وطنية",
//     child: const Icon(Icons.info_rounded,size:18,color: ColorManager.gray200)
// ),