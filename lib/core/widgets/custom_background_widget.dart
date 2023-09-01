import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../utils/size_config.dart';


class CustomBackgroundWidget extends StatelessWidget {
  final Widget bodyWidget;
  final bool? enableStatusBarHeight;
  const CustomBackgroundWidget({Key? key, required this.bodyWidget,this.enableStatusBarHeight=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            SvgAssets.background,
            fit: BoxFit.fitWidth,
            width: SizeConfig.screenWidth!,
          ),
          enableStatusBarHeight!? Padding(
            padding:  EdgeInsets.only(top: SizeConfig.statusBarHeight!),
            child: bodyWidget,
          ):SizedBox( child: bodyWidget,)

        ],
      ),
    );
  }
}
