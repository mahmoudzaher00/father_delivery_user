import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import 'widgets/restaurant_view_widgets/restaurant_view_body.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const RestaurantViewBody(),
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
