import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import 'widgets/meal_ingredients_view_widgets/custom_meal_ingredient_bottom_navigation_bar.dart';
import 'widgets/meal_ingredients_view_widgets/meal_ingredients_view_body.dart';

class MealIngredientsView extends StatelessWidget {
  const MealIngredientsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: const MealIngredientsViewBody(),
      bottomNavigationBar: const CustomMealIngredientBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: SizedBox(
        height: 40,
        width: 54,
        child: FloatingActionButton(
          onPressed: ()=> Navigator.pop(context),
          tooltip: 'back',
          elevation: 3,
          backgroundColor: ColorManager.whiteColor,
          foregroundColor: ColorManager.shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
           child:  const Icon(
            Icons.arrow_back_rounded,
             size: 30,
             color: ColorManager.primaryBlack,
           ),
        ),
      ),
    );
  }
}
