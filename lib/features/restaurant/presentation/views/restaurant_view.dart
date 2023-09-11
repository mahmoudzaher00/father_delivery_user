import 'package:flutter/material.dart';

import 'widgets/restaurant_view_body.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RestaurantViewBody(),
    );
  }
}
