import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class ContainerManager {
  static List<BoxShadow> shadow = [
    const BoxShadow(
        color: ColorManager.shadowColor, blurRadius: 6, spreadRadius: 0, offset: Offset(0, 3))
  ];
  static List<BoxShadow> secondShadow = [
    const BoxShadow(
      color:ColorManager.shadowColor, spreadRadius: 0, blurRadius: 7, offset: Offset(0, 0), // changes position of shadow
    ),
  ];
  static List<BoxShadow> thirdShadow = [
    const BoxShadow(
        color: ColorManager.shadowColor, offset: Offset(0, 0), blurRadius: 4,spreadRadius: 0)
  ];
  static List<BoxShadow> dropDownShadow = [
    const BoxShadow(
        color: ColorManager.shadowColor3, offset: Offset(0, 0), blurRadius: 10)
  ];
}
