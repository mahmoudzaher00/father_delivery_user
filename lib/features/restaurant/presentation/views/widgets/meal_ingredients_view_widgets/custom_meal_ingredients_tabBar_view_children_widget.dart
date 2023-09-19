import 'package:flutter/material.dart';

import 'custom_ingredients_of_meal_widget.dart';
import 'custom_meal_rating_widget.dart';

class CustomMealIngredientsTabBarViewChildrenWidget extends StatelessWidget {
  const CustomMealIngredientsTabBarViewChildrenWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        CustomMealRatingWidget(),
        CustomIngredientsOfMealWidget()
      ],
    );
  }
}


