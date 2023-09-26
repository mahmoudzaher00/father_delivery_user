import 'package:father_delivery_user/core/resources/routes_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/color_manager.dart';
import '../custom_order_state_widget.dart';

class CustomOrderStateSliverList extends StatelessWidget {
  const CustomOrderStateSliverList({super.key,});

  @override
  Widget build(BuildContext context) {
    List list=['فى الطريق للمتجر','تم التسليم للزبون','منتهى','منتهى','منتهى'];
    return SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: ()=> Navigator.pushNamed(context, Routes.orderDetailsRoute,),
                child: CustomOrderStateWidget(
                  orderState: list[index],
                ),
              ),
              if(index != list.length-1 )
                const Divider(color: ColorManager.whiteColor,thickness: 2,)
            ],

          );
        }, childCount: 5

    ));
  }
}
