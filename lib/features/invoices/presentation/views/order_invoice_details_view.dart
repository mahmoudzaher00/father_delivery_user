import 'package:father_delivery_user/features/invoices/presentation/views/widgets/order_invoice_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar_widget.dart';

class OrderInvoiceDetailsView extends StatelessWidget {
  const OrderInvoiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: CustomAppBar(
        appBarToolbarHeight: 50,
        titleContent: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            'تفاصيل الفاتورة',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
      body: const OrderInvoiceDetailsViewBody(),
    );
  }
}
