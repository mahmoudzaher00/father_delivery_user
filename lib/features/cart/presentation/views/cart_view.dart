import 'package:father_delivery_user/core/widgets/custom_app_bar_widget.dart';
import 'package:father_delivery_user/features/cart/presentation/views/widgets/cart_body_widget.dart';
import 'package:father_delivery_user/features/cart/presentation/views/widgets/cart_continue_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/values_manager.dart';

class CartView extends StatelessWidget{
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: CustomAppBar(
       appBarToolbarHeight: AppSize.s60,
       titleContent: Text("السلة",
           style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold)
       ),
     ),
     body: const CartBodyWidget(),
     bottomNavigationBar: const CartContinueButtonWidget(),
   );
  }

}


