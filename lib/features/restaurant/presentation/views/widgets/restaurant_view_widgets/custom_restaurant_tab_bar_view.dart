import 'package:flutter/material.dart';

import '../../../../../../core/app/di.dart';
import '../../../manager/restaurant_cubit/restaurant_cubit.dart';
import 'custom_restaurant_meal_details_grid_view.dart';
import 'custom_restaurant_offer_list_view.dart';

class CustomRestaurantTabBarView extends StatelessWidget {
  const CustomRestaurantTabBarView({super.key,});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: instance<RestaurantCubit>().tabController,
      children: const [
        CustomRestaurantOfferListView(),
        CustomRestaurantMealDetailsGridView(),
        CustomRestaurantMealDetailsGridView(),
        CustomRestaurantMealDetailsGridView(),
        CustomRestaurantMealDetailsGridView(),
      ],
    );
  }
}




