import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../resources/color_manager.dart';


class CustomLoadingWidget extends StatelessWidget {
  final Color? loadingColor;
  final bool? isCircle;
  final double? height;
  final double? width;
  final double? loadingSize;
  const CustomLoadingWidget({
    Key? key, this.loadingColor, this.isCircle=false, this.height, this.width, this.loadingSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

        alignment: Alignment.center,
        width:width?? MediaQuery.of(context).size.width-26,
        height: height??50,
        child:  isCircle!? SpinKitFadingCircle(

            color:loadingColor??  ColorManager.primaryBlack,
            size: loadingSize??50,

        ) :
        SpinKitDoubleBounce(
          color:loadingColor?? const Color(0xff8643FF),
          size:loadingSize?? 50.0,
        )
    );
  }
}