import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/container_manager.dart';
import '../resources/values_manager.dart';
import '../utils/size_config.dart';

class CustomOrderCountAndPaymentWidget extends StatelessWidget {
  final String orderCounts;
  final double orderTotalPayment;
  const CustomOrderCountAndPaymentWidget({super.key, required this.orderCounts, required this.orderTotalPayment});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text(orderCounts,style: Theme.of(context).textTheme.displayMedium!.copyWith(color:ColorManager.primaryOrange)),
            ],
          ),
          const Divider(color:ColorManager.primaryGray),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("إجمالي المدفوعات",style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold
              )),
              Text("$orderTotalPayment  ر.س ",style: Theme.of(context).textTheme.displayMedium!.copyWith(color:ColorManager.primaryOrange)),
            ],
          ),
        ],
      ),
    );
  }
}