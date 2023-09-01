import 'package:flutter/material.dart';

import '../resources/color_manager.dart';


class CustomButton extends StatelessWidget {
  String? text ;
  final FontWeight? texFontWeight;
  Function()? onPressed ;
  double? width ;
  double? height ;
  double? textSize ;
  BoxDecoration? decoration;
  Color? textColor ;
  bool? loading ;
  Color? background ;
  Border? border ;
  Widget? icon ;
  double? borderRadius;
  BorderRadius? borderRadiusObject ;
  List<Color>? colors;
  final bool isGradient;
  final double? heightText;
  final Color? splashColor;
  CustomButton({Key? key,
    this.texFontWeight,
    this.borderRadius,
    this.borderRadiusObject,
    this.textSize = 16,
    this.text,
    this.icon,
    this.background ,
    this.border,
    this.onPressed,
    this.width,
    this.height ,
    this.decoration ,
    this.textColor,
    this.loading =false ,
    this.colors,
    this.isGradient =false,
    this.splashColor=ColorManager.gray100,
    this.heightText
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return loading! ? const CircularProgressIndicator() :
    Container(
      width: width ?? MediaQuery.of(context).size.width-26,
      height: height ?? 56,
      decoration: decoration ?? BoxDecoration(
            color: background ?? ColorManager.primaryBlack,
            borderRadius:borderRadiusObject ??BorderRadius.circular(borderRadius ?? 7),
            border:  border,
            gradient: isGradient?  LinearGradient(
              colors: colors??[
                ColorManager.primaryBlack,
                const Color(0xff545453)
              ],
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
            ):null
        ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor:Colors.white.withOpacity(.2),
          onTap: onPressed,
          child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon?? Container(),
                icon!= null && (text?.isNotEmpty??false) ? const SizedBox(width: 6) : const SizedBox(),
                Text(
                  text??"" ,
                  style: TextStyle(
                    color: textColor??Colors.white ,
                    fontSize: textSize??18 ,
                    fontFamily: "ArbFONTS-DINNextLTArabic",
                    fontWeight: texFontWeight??FontWeight.bold,
                    height: heightText??1
                  ),
                  maxLines: 1,
                   textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
        ),
      ),
    );
  }
}