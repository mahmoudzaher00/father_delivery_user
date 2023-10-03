import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../resources/color_manager.dart';


class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.image,
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
    this.isAsset = false,
    this.errorImageHeight,
    this.errorImageWidth,
    this.errorImageFit,
    this.circleBorderColor, this.circleColor,
  }) : super(key: key);

  final String image;
  final double width;
  final double horizontal;
  final double vertical;
  final double height;
  final double borderWidth;
  final bool isShadow;
  final bool isCircular;
  final Color? borderColor;
  final Color? circleBorderColor;
  final Color? bgColor;
  final bool trBackground;
  final bool isNetwork;
  final bool isAsset;
  final double radius;
  final double? errorImageHeight;
  final double? errorImageWidth;
  final BoxFit? errorImageFit;
  final double? radiusCircleAvatar;
  final Color? circleColor;
  final BorderRadius? borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final errorImage = BlankImageWidget(
      height: errorImageHeight,
      width: errorImageWidth,
      fit: errorImageFit,
    );

    Widget content;
    if (isAsset) {
      content = isCircular ?
      Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          border: Border.all(
              color: circleBorderColor ?? ColorManager.whiteColor),
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: radiusCircleAvatar,
          backgroundColor: circleColor??ColorManager.whiteColor,
          backgroundImage: AssetImage(image,),
        ),
      ) :
      Image.asset(image, height: height, width: width, fit: fit);
    } else if (isNetwork) {
      content = isCircular ?
      CircleAvatar(
        radius: radiusCircleAvatar,
        backgroundColor: ColorManager.whiteColor,
        child: CachedNetworkImage(
          imageUrl: image,
          height: height,
          width: width,
          fit: fit,
          placeholder: (context, url) => const SpinKitRipple(
            color: ColorManager.primaryOrange,
            size: 50.0,
          ),
          errorWidget: (context, url, error) => errorImage,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: fit),
            ),
          ),
        ),
      ) :
      CachedNetworkImage(
        imageUrl: image,
        height: height,
        width: width,
        placeholder: (context, url) => const SpinKitRipple(
          color: ColorManager.primaryOrange,
          size: 50.0,
        ),
        errorWidget: (context, url, error) => errorImage,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(radius),
            image: DecorationImage(image: imageProvider, fit: fit),
          ),
        ),
      );
    } else {
      content = Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
          image: DecorationImage(image: AssetImage(image), fit: fit),
        ),
      );
    }
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
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
          child: content,
        ),
      ),
    );
  }
}

class BlankImageWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxFit? fit;

  const BlankImageWidget({Key? key, this.height, this.width, this.fit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'ImageAssets.noImage',
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
      ),
    );
  }
}


