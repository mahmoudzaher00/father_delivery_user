import 'package:flutter/material.dart';

import '../../../../../core/resources/constants_manager.dart';
import '../../../../../core/resources/routes_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/size_config.dart';
import 'splash_animation_image.dart';
import 'splash_animation_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState(){
    initSlidingAnimation();
    navigateToHome();
    super.initState();
  }

  @override
 void dispose(){
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //stretch : تقدر تاخده width اكبر  children كده انا بقوله عاوز ال
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SplashAnimationText(slidingAnimation: slidingAnimation,ctx: context),
        const SizedBox(height: AppSize.s20),
        SplashAnimationImage(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation(){
    animationController = AnimationController(vsync: this,duration: const Duration(milliseconds:AppConstants.splashAnimationDelay));
    slidingAnimation=Tween<Offset>(begin: const Offset(-1,0) ,end:Offset.zero).animate(animationController);
    animationController.forward();
    slidingAnimation.addListener(() {setState((){}); });

  }
  void navigateToHome() {
    Future.delayed(const Duration(milliseconds: AppConstants.splashDelay), () {
      Navigator.pushReplacementNamed(context, Routes.mealIngredientsRoute);
      // CacheHelper.isOnBoardingScreenViewed().then((isOnBoardingScreenViewed) =>  {
      //   if (isOnBoardingScreenViewed)
      //     {
      //       // navigate to language screen
      //       Navigator.pushReplacementNamed(context, Routes.loginRoute)
      //     } else {
      //     // navigate to onboarding screen
      //     Navigator.pushReplacementNamed(context, Routes.onBoardingRoute)
      //   }
      // });

    });
  }
}





