import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/utils/size_config.dart';
import 'login_view_widgets/custom_skip_login_button_widget.dart';

class CustomStackedTopShapeWidget extends StatelessWidget {
  final bool? isHaveTopWidget;
  const CustomStackedTopShapeWidget({super.key, this.isHaveTopWidget = true,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          alignment: AlignmentDirectional.topCenter,
          width: SizeConfig.screenWidth!,
          height: SizeConfig.screenHeight! * .63,
          child: Row(
            children: [
              SizedBox(
                width: SizeConfig.screenWidth!,
                height: SizeConfig.screenHeight! * .5,
                child: SvgPicture.asset(
                  SvgAssets.authTopShape,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(top: SizeConfig.screenHeight!*.03),
          child: SvgPicture.asset(
            SvgAssets.deliveryWorker,
            fit: BoxFit.fill,
          ),
        ),
        if(isHaveTopWidget!)
          CustomSkipLoginButtonWidget()

      ],
    );
  }
}

