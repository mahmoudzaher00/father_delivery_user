import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_elevated_button_widget.dart';
import 'cart_bottom_sheet_widget.dart';

class CartContinueButtonWidget extends StatelessWidget {
  const CartContinueButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonWidget(
        width: SizeConfig.screenWidth!,
        buttonMargin: EdgeInsetsDirectional.only(start: 25.w,end: 20.w,bottom: 15.h),
        child: Text(
            'استمرار',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 18.sp, color: ColorManager.whiteColor)
        ),
      onPressed: (){
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            context: context,
            backgroundColor: ColorManager.primaryGray,
            isScrollControlled: true,
            useRootNavigator: true,
            elevation: 4,
            builder: (context) => Padding(
                padding:MediaQuery.of(context).viewInsets,
                child: const CartBottomSheetWidget()
            )
        );
      },
    );
  }
}


