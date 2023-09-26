import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/features/restaurant/presentation/manager/restaurant_cubit/restaurant_cubit.dart';
import 'package:flutter/material.dart';

import 'custom_restaurant_sliver_app_bar.dart';
import 'custom_restaurant_tab_bar_view.dart';

class RestaurantViewBody extends StatefulWidget {
  const RestaurantViewBody({Key? key}) : super(key: key);

  @override
  State<RestaurantViewBody> createState() => _RestaurantViewBodyState();
}

class _RestaurantViewBodyState extends State<RestaurantViewBody>  with SingleTickerProviderStateMixin{
  int index=0;
  @override
  void initState() {
    instance<RestaurantCubit>().tabController=TabController(length:  instance<RestaurantCubit>().restaurantTabBarList.length, vsync: this);
    instance<RestaurantCubit>().tabController.addListener(instance<RestaurantCubit>().tabBarSwapIndex);
    super.initState();
  }
  @override
  void dispose() {
    instance<RestaurantCubit>().tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: instance<RestaurantCubit>().restaurantTabBarList.length,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [const CustomRestaurantSliverAppBar()
          ],
          body: const CustomRestaurantTabBarView(),
        ));

  }
}





