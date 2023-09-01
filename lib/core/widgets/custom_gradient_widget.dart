import 'package:flutter/material.dart';

class RadiantGradientMask extends StatelessWidget {
  final Widget child;
  final List<Color>? colors;
   const RadiantGradientMask({Key? key, required this.child,this.colors}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode:BlendMode.srcATop ,
      shaderCallback: (bounds) =>  LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: colors??[
          const Color(0xff8643FF),
          const Color(0xff4136F1),
        ],
      ).createShader(bounds),
      child: child,
    );
  }
}