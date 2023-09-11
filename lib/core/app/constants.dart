
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Constants {
  static const String baseUrl = "http://minafarid246.mocklab.io";
  static const String mapSearchUrl = "https://api.openrouteservice.org/geocode/search";
  static const String empty = "";
  static const String token = "SEND TOKEN HERE";
  static const int zero = 0;
  static const int apiTimeOut = 60000;
  static const SystemUiOverlayStyle systemUiOverlayStyle=SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // set the color of the status bar
      statusBarIconBrightness: Brightness.light
  );
  static const SystemUiOverlayStyle systemUiOverlayStyleDark=SystemUiOverlayStyle(
      statusBarColor: ColorManager.whiteColor, // set the color of the status bar
      statusBarIconBrightness: Brightness.dark
  );

}
