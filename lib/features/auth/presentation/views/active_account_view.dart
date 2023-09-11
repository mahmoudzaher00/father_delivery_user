import 'package:father_delivery_user/core/app/constants.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'widgets/active_account_view_widgets/active_account_view_body.dart';

class ActiveAccountView extends StatelessWidget {
  const ActiveAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        systemOverlayStyle: Constants.systemUiOverlayStyleDark,
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.whiteColor,
        surfaceTintColor: ColorManager.whiteColor,
          toolbarHeight: SizeConfig.statusBarHeight,
      ),
      body: ActiveAccountViewBody(),
    );
  }
}
