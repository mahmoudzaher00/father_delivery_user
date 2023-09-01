import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';


class SlidingText extends StatelessWidget {
  const SlidingText({Key? key, required this.slidingAnimation,}) : super(key: key);

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: slidingAnimation,
        child: Text('MAAS TECHNICAL',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: ColorManager.blackColor,
            fontSize: FontSize.s24.sp
          ),
        )
    );
  }
}
