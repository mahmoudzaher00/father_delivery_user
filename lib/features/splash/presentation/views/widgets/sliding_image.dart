import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlidingImage extends StatelessWidget {
  const SlidingImage({Key? key, required this.slidingAnimation}) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: slidingAnimation,
        child: SvgPicture.asset(SvgAssets.splashBike)
    );
  }
}

