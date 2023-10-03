import 'package:flutter/material.dart';

import 'custom_restaurant_sliver_app_bar.dart';
import 'custom_restaurant_page_view_body.dart';

class RestaurantViewBody extends StatefulWidget {
  const RestaurantViewBody({Key? key}) : super(key: key);

  @override
  State<RestaurantViewBody> createState() => _RestaurantViewBodyState();
}

class _RestaurantViewBodyState extends State<RestaurantViewBody>{
  final PageController _pageController = PageController(initialPage: 0,keepPage: false);

  @override
  void dispose() {
   _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [CustomRestaurantSliverAppBar(pageController: _pageController,)
          ],
          body:  CustomRestaurantPageViewBody(pageController: _pageController,),
        );

  }
}





