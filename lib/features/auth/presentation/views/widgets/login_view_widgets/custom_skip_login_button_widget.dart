import 'package:flutter/material.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/routes_manager.dart';

class CustomSkipLoginButtonWidget extends StatelessWidget {
  const CustomSkipLoginButtonWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: ()=>Navigator.pushNamedAndRemoveUntil(context, Routes.homeRoute, (route) => false),
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.whiteColor,
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Text(
              'تخطى التسجيل',
              style: Theme.of(context).textTheme.displayMedium,
            )
        ),
      ],
    );
  }
}
