import 'package:father_delivery_user/core/resources/constants_manager.dart';
import 'package:father_delivery_user/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';

class SplashAnimationText extends StatelessWidget {
  const SplashAnimationText({super.key,required this.slidingAnimation, required this.ctx});

  final Animation<Offset> slidingAnimation;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
            animation: slidingAnimation,
            builder: (context,_){
              return SlidingText(slidingAnimation: slidingAnimation,text:'Delivery',
                  textColor:ColorManager.primaryBlack
              );
            }
        ),
        const SizedBox(width: AppSize.s10),
        FutureBuilder(
            future: Future.delayed(const Duration(milliseconds:AppConstants.textAnimationTime)),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AnimatedBuilder(
                    animation: slidingAnimation,
                    builder: (context,_){
                      return SlidingText(slidingAnimation: slidingAnimation,
                          text:'Father',
                          textColor:ColorManager.primaryOrange
                      );
                    }
                );
              } else {
                return const SizedBox(width: AppSize.s90);
              }
            }
        ),
      ],
    );
  }
}