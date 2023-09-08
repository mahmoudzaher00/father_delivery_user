import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/features/splash/presentation/views/widgets/sliding_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashAnimationImage extends StatelessWidget {
  const SplashAnimationImage({
  super.key,
  required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          SizedBox(
              width: SizeConfig.screenWidth!,
              child: SvgPicture.asset(SvgAssets.splashBackground)
          ),
          Container(
            width: SizeConfig.screenWidth! * 0.5 ,
            margin: const EdgeInsets.only(right: AppMargin.m20),
            alignment: Alignment.bottomLeft,
            child: AnimatedBuilder(
                animation: slidingAnimation,
                builder: (context,_){
                  return SlidingImage(slidingAnimation: slidingAnimation);
                }
            ),
          ),
        ],
      ),
    );
  }
}