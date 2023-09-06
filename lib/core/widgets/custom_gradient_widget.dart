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
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
         tileMode: TileMode.decal,
        colors: colors??[
          const Color(0xffFF8C69),
          const Color(0xffEF554A),
        ],
      ).createShader(bounds),
      child: child,
    );
  }
}