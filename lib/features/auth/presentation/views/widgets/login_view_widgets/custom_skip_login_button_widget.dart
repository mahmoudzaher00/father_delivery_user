import 'package:flutter/material.dart';

import '../../../../../../core/app/app_prefs.dart';
import '../../../../../../core/app/di.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/utils/size_config.dart';

class CustomSkipLoginButtonWidget extends StatelessWidget {
  const CustomSkipLoginButtonWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right:   instance<AppPreferences>().getAppLanguage() == 'ar' ?20:null,
      left:   instance<AppPreferences>().getAppLanguage() == 'en' ?20:null,
      top: SizeConfig.statusBarHeight,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Text(
            'تخطى التسجيل',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(decoration: TextDecoration.underline),
          )
      ),
    );
  }
}
