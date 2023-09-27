import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/features/my_orders/presentation/views/widgets/sliver_app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../../manager/my_orders_cubit/my_orders_cubit.dart';
import 'custom_tab_bar_children_views.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: AppSize.s3,
        child: NestedScrollView(
            headerSliverBuilder: ((context, innerBoxIsScrolled) {
              return [
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverSafeArea(
                      top: false,
                      sliver: SliverAppBarWidget(
                          tabController: instance<MyOrdersCubit>().tabController,
                          forceElevated: innerBoxIsScrolled
                      )
                  ),
                )
              ];
            }),
            body: CustomTabBarChildrenViews(tabController: instance<MyOrdersCubit>().tabController)
        )
    );
  }
}