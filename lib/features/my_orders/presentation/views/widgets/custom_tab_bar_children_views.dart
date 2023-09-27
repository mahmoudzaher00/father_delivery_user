import 'package:father_delivery_user/features/my_orders/presentation/views/widgets/tab_bar_children_widgets/general_order_view.dart';
import 'package:father_delivery_user/features/my_orders/presentation/views/widgets/tab_bar_children_widgets/restaurant_tab_view.dart';
import 'package:father_delivery_user/features/my_orders/presentation/views/widgets/tab_bar_children_widgets/special_order_view.dart';
import 'package:flutter/material.dart';

class CustomTabBarChildrenViews extends StatelessWidget {
  final TabController? tabController;
  const CustomTabBarChildrenViews({super.key, this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      physics: const BouncingScrollPhysics(),
      children: const [
        RestaurantTabBarView(),
        GeneralStoresView(),
        SpecialOrderView()
      ],
    );
  }
}