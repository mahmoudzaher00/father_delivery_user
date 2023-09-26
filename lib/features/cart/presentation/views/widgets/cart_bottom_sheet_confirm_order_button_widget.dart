import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/size_config.dart';

class CartBottomSheetConfirmOrderButtonWidget extends StatelessWidget {
  const CartBottomSheetConfirmOrderButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(AppSize.s12),
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient:  const LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              tileMode: TileMode.decal,
              colors: [Color(0xffEF554A), Color(0xffFF8C69)])
      ),
      child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: ColorManager.lightOrange,
              padding: EdgeInsets.zero
          ),
          child:  Text('تأكيد الطلب',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(color: ColorManager.whiteColor)
          )
      ),
    );
  }
}