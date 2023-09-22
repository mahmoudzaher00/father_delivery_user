import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/features/cart/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/values_manager.dart';
import 'cart_list_item_widget.dart';

class CartListWidget extends StatefulWidget {
  const CartListWidget({super.key});

  @override
  State<CartListWidget> createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  @override
  void initState() {
    super.initState();
    CartCubit.get(context).getCountFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: CartCubit.get(context).cartList.length,
          shrinkWrap: true,
          padding: const EdgeInsets.all(AppPadding.p8),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return CartListItemWidget(index: index);
            },
          separatorBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsetsDirectional.only(start: AppSize.s60),
              child: Divider(color: ColorManager.whiteColor),
            );
            });
        },
    );
  }
}
