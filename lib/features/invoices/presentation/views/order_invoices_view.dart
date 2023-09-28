import 'package:father_delivery_user/features/invoices/presentation/views/widgets/order_invoices_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/container_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';


class OrderInvoicesView extends StatelessWidget {
  const OrderInvoicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarToolbarHeight: 50,
        titleContent: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            'الفواتير',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
      body: const OrderInvoicesViewBody(),
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
  }
}









