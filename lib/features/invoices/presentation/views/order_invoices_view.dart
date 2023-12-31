import 'package:father_delivery_user/features/invoices/presentation/views/widgets/order_invoices_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar_widget.dart';
import '../../../../core/widgets/custom_order_count_payment_widget.dart';


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
      bottomNavigationBar: const CustomOrderCountAndPaymentWidget(orderCounts: '9', orderTotalPayment: 2000),
    );
  }
}









