import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/routes_manager.dart';
import 'order_invoice_state_widget.dart';

class OrderInvoiceStateSliverList extends StatelessWidget {
  const OrderInvoiceStateSliverList({super.key,});

  @override
  Widget build(BuildContext context) {
    List list=['فى الطريق للمتجر','تم التسليم للزبون','منتهى','منتهى','منتهى'];
    return SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: ()=> Navigator.pushNamed(context, Routes.orderInvoiceDetailsViewRoute),
                child: OrderInvoiceStateWidget(
                  orderState: list[index],
                ),
              ),
              if(index != list.length-1 )
                const Divider(color: ColorManager.whiteColor,thickness: 2)
            ],

          );
        }, childCount: 5

    ));
  }
}



