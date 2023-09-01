import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primaryBlack,
    primaryColorLight: ColorManager.primaryOrange,
    primaryColorDark: ColorManager.gray600,
    disabledColor: ColorManager.blackColor,
    // platform: TargetPlatform.iOS,
    androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
    useMaterial3: true,

    // ripple effect color
    splashColor: ColorManager.gray100,
    // scaffold Background color
    scaffoldBackgroundColor:ColorManager.primaryGray,


    // cardview theme
    cardTheme: const CardTheme(
        color: ColorManager.whiteColor,
        // shadowColor: ColorManager.cardShadow,
        elevation: AppSize.s4),
    // app bar theme
    appBarTheme: AppBarTheme(
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   statusBarColor: ColorManager.white,
        //   statusBarIconBrightness: Brightness.light,
        // ),
        color: ColorManager.primaryGray,
        surfaceTintColor:ColorManager.primaryGray,
        elevation: AppSize.s0,
        // shadowColor: ColorManager.white,
        // iconTheme: IconThemeData(color: Colors.red),
        titleTextStyle: getBoldStyle(fontSize: FontSize.s14, color: ColorManager.primaryBlack)
    ),
    // button theme
    buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.gray600,
        buttonColor: ColorManager.gray400,
        splashColor: ColorManager.gray100
    ),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(color: ColorManager.whiteColor, fontSize: FontSize.s17),
            backgroundColor: ColorManager.primaryBlack,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    textTheme: TextTheme(
        // titleLarge: getExtraBoldStyle(color: ColorManager.primaryBlack, fontSize: FontSize.s21,),
        bodyLarge:  getBoldStyle(color: ColorManager.primaryBlack, fontSize: FontSize.s16),
        bodyMedium:getMediumStyle(color: ColorManager.primaryBlack, fontSize: FontSize.s14),
        bodySmall: getRegularStyle(color: ColorManager.primaryBlack),
        // headlineLarge: getSemiBoldStyle(color:ColorManager.primaryBlack, fontSize: FontSize.s16)


        // headlineLarge:getExtraBoldStyle(color: ColorManager.black, fontSize: FontSize.s16),
        // labelLarge: getSemiExtraBoldStyle(color:ColorManager.darkGrey, fontSize: FontSize.s16),
        // displayLarge: getBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
        // headlineMedium: getMediumStyle(color: ColorManager.black, fontSize: FontSize.s14),
        // titleMedium: getMediumStyle(color: ColorManager.black, fontSize: FontSize.s16),
        // titleSmall: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
        // bodyLarge: getRegularStyle(color: ColorManager.black),
        // bodySmall: getRegularStyle(color: ColorManager.grey),
        // bodyMedium: getRegularStyle(color: ColorManager.black, fontSize: FontSize.s12),
        // labelSmall: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s12),
        // headlineSmall: getLightStyle(color: ColorManager.darkGrey, fontSize: FontSize.s12),
        // displaySmall: getExtraLightStyle(color: ColorManager.darkGrey, fontSize: FontSize.s12),
    ),

    // input decoration theme (text form field)
    // inputDecorationTheme: InputDecorationTheme(
    //
    //     // background color
    //     fillColor:ColorManager.white ,
    //     filled: true,
    //     // content padding
    //     contentPadding: const EdgeInsets.all(AppPadding.p8),
    //     // hint style
    //     hintStyle: getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
    //     labelStyle: getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
    //     errorStyle: getRegularStyle(color: ColorManager.red),
    //
    //     // enabled border style
    //
    //     enabledBorder: const OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.lightGrey, width: AppSize.s1_5),
    //         borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
    //
    //     // focused border style
    //     focusedBorder: const OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.primaryBlue, width: AppSize.s1_5),
    //         borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
    //
    //     // error border style
    //     errorBorder: const OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.red, width: AppSize.s1_5),
    //         borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
    //          focusColor: Colors.red,
    //     // focused border style
    //     focusedErrorBorder: const OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.primaryBlue, width: AppSize.s1_5),
    //         borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ColorManager.primaryBlack
    ),
    // label style
  );
}
