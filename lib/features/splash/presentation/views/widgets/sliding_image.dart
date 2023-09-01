import 'package:flutter/material.dart';

import 'sliding_text.dart';

class SlidingImage extends StatelessWidget {
  const SlidingImage({
    Key? key,
    required this.slidingAnimation,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: slidingAnimation,
        child: Column(
          children: [
            // SvgPicture.asset(SvgAssets.logo),
            // SizedBox(height: 12.h,),
            SlidingText(slidingAnimation: slidingAnimation,),
          ],
        )
    );
  }
}
