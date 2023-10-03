import 'package:father_delivery_user/core/app/extensions.dart';
import 'package:flutter/material.dart';

import 'custom_restaurant_meal_details_widget.dart';

class CustomRestaurantMealDetailsGridView extends StatelessWidget {
  const CustomRestaurantMealDetailsGridView({super.key,});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.withFormFactor<int>(
            onMobile: 2,
            onDesktop: 8,
            onTablet: 4
        ), // Number of grid columns
        mainAxisSpacing: 1.0, // Spacing between grid items vertically
        crossAxisSpacing: 1.0, // Spacing between grid items horizontally
        childAspectRatio: 1.0, // Ratio of grid item's width to its height
      ),
      itemBuilder:  (context, index) => const CustomRestaurantMealDetailsWidget(),
    );
  }
}