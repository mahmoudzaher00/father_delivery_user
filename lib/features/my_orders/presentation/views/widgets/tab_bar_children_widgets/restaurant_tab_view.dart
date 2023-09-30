import 'package:father_delivery_user/features/my_orders/presentation/views/widgets/restaurant_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_order_count_payment_widget.dart';
import '../../../manager/my_orders_cubit/my_orders_cubit.dart';
import '../../../manager/my_orders_cubit/my_orders_state.dart';


class RestaurantTabBarView extends StatelessWidget{
  const RestaurantTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersCubit,MyOrdersState>(
      builder: (context, state) {
        return const Scaffold(
          body:  RestaurantListViewWidget(),
          bottomNavigationBar: CustomOrderCountAndPaymentWidget(orderCounts: '9', orderTotalPayment: 2000),
        );
       },
    );
  }
}











