import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/font_manager.dart';


class SlidingText extends StatelessWidget {
  const SlidingText({Key? key, required this.slidingAnimation,this.text, this.textColor}) : super(key: key);
  final Animation<Offset> slidingAnimation;
  final String? text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: slidingAnimation,
        child: Text(text!,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: textColor,
            fontSize: FontSize.s36.sp
          ),
        )
    );
  }
}
