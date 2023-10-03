import 'package:carousel_slider/carousel_slider.dart';
import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_image_widget.dart';
import 'package:father_delivery_user/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SliderImage extends StatelessWidget {
  const SliderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: instance<HomeCubit>().sliderImages.map((item) {
        return CustomImage(
          image:item,
          isNetwork: false,
          width: SizeConfig.screenWidth! * 0.98,
          isShadow: true,
        );
      }).toList(),
      carouselController: instance<HomeCubit>().carouselController,
      options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          height: SizeConfig.screenHeight! * 0.2 ,
          aspectRatio: 1,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayAnimationDuration:
          const Duration(seconds: 4),
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            if (kDebugMode) {
              print('>>>>>>>>>>>>>>>>>>>>>>>>>>$index');
            }
            HomeCubit.get(context).changeIndicator(index);
            //instance<HomeCubit>().changeIndicator(index);
          }),
    );
  }
}