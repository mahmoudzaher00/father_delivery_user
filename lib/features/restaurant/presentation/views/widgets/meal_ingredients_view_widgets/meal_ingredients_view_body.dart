import 'package:flutter/material.dart';

import 'custom_meal_ingredients_sliver_app_bar.dart';
import 'custom_meal_ingredients_tabBar_view_children_widget.dart';

class MealIngredientsViewBody extends StatelessWidget {
  const MealIngredientsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
          [const CustomMealIngredientsSliverAppBar(),],
          body: const CustomMealIngredientsTabBarViewChildrenWidget(),
        ));
  }
}


