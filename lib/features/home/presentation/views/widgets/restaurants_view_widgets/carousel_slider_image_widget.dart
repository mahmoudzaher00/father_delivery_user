import 'package:father_delivery_user/features/home/presentation/views/widgets/restaurants_view_widgets/slider_image.dart';
import 'package:flutter/material.dart';

import 'indicator_widget.dart';

class CarouselSliderImageWidget extends StatelessWidget {
  const CarouselSliderImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.bottomCenter,
        children: const [
          SliderImage(),
          IndicatorWidget()
        ]
    );
  }
}