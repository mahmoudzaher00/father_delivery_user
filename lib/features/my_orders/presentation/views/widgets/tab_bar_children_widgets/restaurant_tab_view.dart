import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/features/my_orders/presentation/views/widgets/restaurant_list_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/container_manager.dart';
import '../../../manager/my_orders_cubit/my_orders_cubit.dart';
import '../../../manager/my_orders_cubit/my_orders_state.dart';


class RestaurantTabBarView extends StatelessWidget{
  const RestaurantTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersCubit,MyOrdersState>(
      builder: (context, state) {
        return Scaffold(
          body:  const RestaurantListViewWidget(),
          bottomNavigationBar: Container(
            height: AppSize.s100,
            width: SizeConfig.screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16,vertical: AppPadding.p10),
            decoration: BoxDecoration(
                color: ColorManager.whiteColor,
                boxShadow: ContainerManager.shadow
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("إجمالي الطلبات",style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.bold
                    )),
                    Text("10",style: Theme.of(context).textTheme.displayMedium!.copyWith(color:ColorManager.primaryOrange)),
                  ],
                ),
                const Divider(color:ColorManager.primaryGray),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("إجمالي المدفوعات",style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.bold
                    )),
                    Text("2000 ر.س",style: Theme.of(context).textTheme.displayMedium!.copyWith(color:ColorManager.primaryOrange)),
                  ],
                ),
              ],
            ),
          ),
        );
       },
    );
  }
}











