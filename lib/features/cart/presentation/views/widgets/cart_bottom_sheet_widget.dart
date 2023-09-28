
import 'package:father_delivery_user/features/cart/presentation/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/size_config.dart';
import 'cart_bottom_sheet_confirm_order_button_widget.dart';
import 'custom_radio_widget.dart';

class CartBottomSheetWidget extends StatelessWidget {
  const CartBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          height: AppSize.s320,
          width: SizeConfig.screenWidth,
          color: ColorManager.primaryGray,
          child: Scaffold(
              backgroundColor: ColorManager.primaryGray,
              body: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    ListView.builder(
                        itemCount: CartCubit.get(context).deliveryRadioList.length,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return CustomRadioWidget(
                            title: CartCubit.get(context).deliveryRadioList[index].title!,
                            description: CartCubit.get(context).deliveryRadioList[index].description!,
                            radioValue: CartCubit.get(context).deliveryRadioList[index].radioValue,
                            radioGroupValue: CartCubit.get(context).deliveryStatusValue,
                            onTap: (){
                              CartCubit.get(context).changeDeliveryStatus(index);
                            },
                            onChange: (int? value) {
                              CartCubit.get(context).changeDeliveryStatus(value!);
                            },
                          );
                        }),
                    const Divider(color: ColorManager.whiteColor),
                    ListView.builder(
                        itemCount: CartCubit.get(context).paymentRadioList.length,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return CustomRadioWidget(
                            title: CartCubit.get(context).paymentRadioList[index].title!,
                            description: CartCubit.get(context).paymentRadioList[index].description!,
                            radioValue: CartCubit.get(context).paymentRadioList[index].radioValue,
                            radioGroupValue: CartCubit.get(context).paymentStatusValue,
                            onTap: (){
                              CartCubit.get(context).changePaymentStatus(index);
                            },
                            onChange: (int? value) {
                              CartCubit.get(context).changePaymentStatus(value!);
                            },
                          );
                        }),
                  ],
                ),
              ),
              bottomNavigationBar: const CartBottomSheetConfirmOrderButtonWidget()
          ),
        );
      },
    );
  }
}