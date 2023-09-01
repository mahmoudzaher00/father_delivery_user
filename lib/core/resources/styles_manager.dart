import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize, fontFamily: FontConstants.fontFamily, color: color, fontWeight: fontWeight);
}



// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// semi bold style

// TextStyle getSemiBoldStyle(
//     {double fontSize = FontSize.s15, required Color color}) {
//   return _getTextStyle(fontSize, FontWeightManager.semiExtraBold, color);
// }

// bold style

TextStyle getBoldStyle({double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// bold style

// TextStyle getExtraBoldStyle({double fontSize = FontSize.s21, required Color color}) {
//   return _getTextStyle(fontSize, FontWeightManager.extraBold, color,);
// }




