import 'package:flutter/material.dart';

import 'custom_restaurant_offers_widget.dart';

class CustomRestaurantOfferListView extends StatelessWidget {
  const CustomRestaurantOfferListView({super.key,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 4,
        itemBuilder:  (context, index) =>  const CustomRestaurantOfferWidget()
    );
  }
}