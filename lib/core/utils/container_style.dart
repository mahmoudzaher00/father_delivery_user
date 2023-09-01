import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class ContainerStyle{
  static List<BoxShadow> shadow=[
    const BoxShadow(
        color:ColorManager.shadowColor,
        offset: Offset(0,0),
        blurRadius: 5
    )
  ];
  static List<BoxShadow> secondShadow=[
    const BoxShadow(
        color:ColorManager.shadowColor,
        offset: Offset(0,-5),
        blurRadius: 12
    )
  ];
  static List<BoxShadow> thirdShadow=[
    const   BoxShadow(
        color:ColorManager.shadowColor2,
        offset: Offset(1,1),
        blurRadius: 10
    )
  ];
  static List<BoxShadow> dropDownShadow=[
    const   BoxShadow(
        color:ColorManager.shadowColor3,
        offset: Offset(0,0),
        blurRadius: 10
    )
  ];
}