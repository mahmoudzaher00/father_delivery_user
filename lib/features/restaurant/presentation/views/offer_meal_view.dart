import 'package:flutter/material.dart';

import 'widgets/offer_meal_view_widgets/custom_bottom_navigation_bar_button.dart';
import 'widgets/offer_meal_view_widgets/offer_meal_view_body.dart';

class OfferMealView extends StatelessWidget {
  const OfferMealView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: OfferMealViewBody(),
      bottomNavigationBar: CustomBottomNavigationBarButton(),
    );
  }
}


