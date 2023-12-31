import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../manager/store_products_cubit/store_products_cubit.dart';
import '../../manager/store_products_cubit/store_products_state.dart';

class ProductTypesListWidget extends StatelessWidget {
  final PageController pageController;
  const ProductTypesListWidget({super.key,required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s40,
      child: BlocBuilder<StoreProductsCubit, StoreProductsState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: StoreProductsCubit.get(context).productsTypeList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: AppMargin.m4,vertical: 3),
                  child: ElevatedButton(
                    onPressed: () {
                      pageController.jumpToPage(index);
                      StoreProductsCubit.get(context).changeProductTypeValue(index);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: StoreProductsCubit.get(context).productTypeFilterValue == index ?
                        ColorManager.primaryOrange :ColorManager.primaryGray,
                        surfaceTintColor: ColorManager.transparentColor,
                        foregroundColor:  ColorManager.borderColor,
                        shadowColor: ColorManager.shadowColor,
                        elevation: 1,


                        // shadowColor: ColorManager.shadowColor,
                        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        )
                    ),

                    child: Text(StoreProductsCubit.get(context).productsTypeList[index],
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: StoreProductsCubit.get(context).productTypeFilterValue == index ?
                          ColorManager.whiteColor : ColorManager.grayIcon,
                        )),
                  ),
                );
              }
          );
        },
      ),
    );
  }
}