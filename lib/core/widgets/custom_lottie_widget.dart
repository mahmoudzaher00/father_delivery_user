import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../resources/assets_manager.dart';
import '../utils/size_config.dart';

// ignore: must_be_immutable
class CustomLottieWidget extends StatelessWidget {
   CustomLottieWidget({
    Key? key,

    this.lottieName,
    this.height,
    this.width,
  }) : super(key: key);


  String? lottieName;
  double?height;
  double?width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        lottieName??JsonAssets.recordAudio,
        width:width??SizeConfig.screenWidth!*.7,
        height: height??SizeConfig.screenHeight!*.5,
        repeat: true,
        animate: true,
        onLoaded: (composition) {},
        fit: BoxFit.fill,),);
  }
}
