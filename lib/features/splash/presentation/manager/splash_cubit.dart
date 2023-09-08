import 'package:father_delivery_user/core/resources/constants_manager.dart';
import 'package:father_delivery_user/core/resources/routes_manager.dart';
import 'package:father_delivery_user/features/splash/presentation/manager/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  static SplashCubit get(context)=>BlocProvider.of(context);



  void navigateToHome(BuildContext context) {
    Future.delayed(const Duration(milliseconds:AppConstants.splashDelay), () {
      Navigator.pushReplacementNamed(context, Routes.mapRoute);
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

    });
  }


}