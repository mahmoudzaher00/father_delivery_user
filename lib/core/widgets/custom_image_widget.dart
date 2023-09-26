import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../resources/color_manager.dart';


class CustomImage extends StatelessWidget {
  const CustomImage(
      this.image, {
        super.key,
        this.width = 100,
        this.height = 100,
        this.bgColor,
        this.borderWidth = 0,
        this.borderColor,
        this.trBackground = false,
        this.fit = BoxFit.fill,
        this.isNetwork = true,
        this.radius = 6,
        this.borderRadius,
        this.isShadow = true,
        this.isCircular = false,
        this.horizontal = 0,
        this.vertical = 0,
        this.radiusCircleAvatar,
        this.isAsset=false,
        this.circleBorderColor
      });

  final String image;
  final double width;
  final double? horizontal;
  final double? vertical;
  final double height;
  final double borderWidth;
  final bool isShadow;
  final bool isCircular;
  final Color? borderColor;
  final Color? circleBorderColor;
  final Color? bgColor;
  final bool trBackground;
  final bool isNetwork;
  final bool? isAsset;
  final double radius;
  final double? radiusCircleAvatar;
  final BorderRadius? borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (isShadow)
            BoxShadow(
              color: Colors.black87.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal!, vertical: vertical!),
        child: ClipRRect(
          borderRadius: borderRadius??BorderRadius.circular(radius),
          child:isAsset!?
          isCircular?
          Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              border: Border.all(color: circleBorderColor ?? ColorManager.whiteColor),
              shape: BoxShape.circle
            ),
            child: CircleAvatar(
              radius:radiusCircleAvatar,
              backgroundColor: ColorManager.whiteColor,
              backgroundImage: AssetImage(image),
              // child:  Image.asset(ImageAssets.profile)
            ),
          ):
          Image.asset(image,height: height,width: width,fit: fit,):

          isNetwork ?
          isCircular ?
          CircleAvatar(
              radius:radiusCircleAvatar,
              backgroundColor: ColorManager.whiteColor,
              child:  CachedNetworkImage(
                imageUrl: image,
                height: height,
                width: width,
                fit: fit,
                placeholder: (context, url) =>  const SpinKitRipple(
                  color: ColorManager.primaryOrange,
                  size: 50.0,
                ),
                errorWidget: (context, url, error) => const BlankImageWidget(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle  ,
                    image: DecorationImage(image: imageProvider, fit: fit),
                  ),
                ),
              )
          ) :
          CachedNetworkImage(
            imageUrl: image,
            height: height,
            width: width,
            placeholder: (context, url) =>  const SpinKitRipple(
              color: ColorManager.primaryOrange,
              size: 50.0,
            ),
            errorWidget: (context, url, error) => const BlankImageWidget(),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(radius),
                image: DecorationImage(image: imageProvider, fit: fit),
              ),
            ),
          ) :
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(radius),
              image: DecorationImage(image: AssetImage(image), fit: fit),
            ),
          ),
        ),
      ),
    );
  }
}

class BlankImageWidget extends StatefulWidget {
  const BlankImageWidget({Key? key}) : super(key: key);

  @override
  _BlankImageWidgetState createState() => _BlankImageWidgetState();
}

class _BlankImageWidgetState extends State<BlankImageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(0),
      child: Center(
          child: SizedBox(
              child: Card(
                  margin: EdgeInsets.zero,
                  clipBehavior: Clip.antiAlias,
                  elevation: 0.0))),
    );
  }
}


