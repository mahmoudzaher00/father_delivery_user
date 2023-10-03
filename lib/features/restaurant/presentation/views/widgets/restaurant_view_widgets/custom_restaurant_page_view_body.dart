import 'package:flutter/material.dart';

import '../../../../../../core/app/di.dart';
import '../../../manager/restaurant_cubit/restaurant_cubit.dart';
import 'custom_restaurant_meal_details_grid_view.dart';
import 'custom_restaurant_offer_list_view.dart';

class CustomRestaurantPageViewBody extends StatelessWidget {
  final PageController pageController;

  const CustomRestaurantPageViewBody({super.key, required this.pageController,});

  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: true,
      controller: pageController,
      physics: const ClampingScrollPhysics(),
      onPageChanged: instance<RestaurantCubit>().pageViewSwapIndex,
      children:const [
        CustomRestaurantOfferListView(),
        CustomRestaurantMealDetailsGridView(),
        CustomRestaurantMealDetailsGridView(),
        CustomRestaurantMealDetailsGridView(),
        CustomRestaurantMealDetailsGridView(),
      ]
    );
  }
}




