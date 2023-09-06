import 'package:flutter/material.dart';


import '../../../../../core/resources/constants_manager.dart';
import '../../../../../core/resources/routes_manager.dart';
import '../../../../../core/utils/size_config.dart';
import 'sliding_image.dart';

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
        const SizedBox(height: 4,),
        AnimatedBuilder(
          animation: slidingAnimation,
          builder: (context,_){
            return SlidingImage(slidingAnimation: slidingAnimation);
          }
        ),

      ],
    );
  }
  void initSlidingAnimation(){
    animationController=AnimationController(vsync: this,duration: const Duration(seconds: AppConstants.splashDelay) );
    slidingAnimation=Tween<Offset>(begin: const Offset(0,3) ,end:Offset.zero).animate(animationController);
    animationController.forward();
    slidingAnimation.addListener(() {setState((){}); });

  }
  void navigateToHome() {
    Future.delayed(const Duration(seconds: AppConstants.splashDelay), () {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
      // CacheHelper.isOnBoardingScreenViewed().then((isOnBoardingScreenViewed) =>  {
      //           if (isOnBoardingScreenViewed)
      //           {
      //             // navigate to language screen
      //             Navigator.pushReplacementNamed(context, Routes.loginRoute)
      //           } else {
      //             // navigate to onboarding screen
      //             Navigator.pushReplacementNamed(context, Routes.onBoardingRoute)
      //           }
      //         });
      //
        });
  }
}

