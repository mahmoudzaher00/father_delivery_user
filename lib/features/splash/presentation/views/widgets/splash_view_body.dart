import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/features/splash/presentation/manager/splash_cubit.dart';
import 'package:father_delivery_user/features/splash/presentation/views/widgets/splash_animation_image.dart';
import 'package:father_delivery_user/features/splash/presentation/views/widgets/splash_animation_text.dart';
import 'package:flutter/material.dart';
import '../../../../../core/resources/constants_manager.dart';
import '../../../../../core/utils/size_config.dart';

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
    SplashCubit.get(context).navigateToHome(context);
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
    animationController = AnimationController(vsync: this,duration: const Duration(milliseconds:AppConstants.splashDelay));
    slidingAnimation=Tween<Offset>(begin: const Offset(-1,0) ,end:Offset.zero).animate(animationController);
    animationController.forward();
    slidingAnimation.addListener(() {setState((){}); });

  }
}





