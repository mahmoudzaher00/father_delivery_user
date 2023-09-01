import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../resources/color_manager.dart';
import '../utils/size_config.dart';

class CustomLoadingShimmer extends StatelessWidget {
  final Color? baseColor;
  final Color? highlightColor;
  final Color? containerColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  final bool? isCircle;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const CustomLoadingShimmer({Key? key, this.baseColor, this.highlightColor, this.height, this.width, this.margin, this.padding, this.containerColor, this.borderRadius, this.isCircle=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: baseColor??ColorManager.dividerColor,
        highlightColor:highlightColor??ColorManager.gray200,
        enabled: true,
        child: Container(
          height: height??5,
          width: width??SizeConfig.screenWidth!*.2,
          margin: margin??const EdgeInsets.symmetric(horizontal: 10),
          padding: padding??const EdgeInsets.all(8),
          decoration:isCircle!?
          BoxDecoration(
            color:containerColor??ColorManager.gray200,
            shape: BoxShape.circle
          ):
          BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius??8),
            color:containerColor??ColorManager.gray200,

          )
        ));
  }
}
