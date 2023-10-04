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
      height: AppSize.s36,
      child: BlocBuilder<StoreProductsCubit, StoreProductsState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: StoreProductsCubit.get(context).productsTypeList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(6),
                  onTap: (){
                    pageController.jumpToPage(index);
                    StoreProductsCubit.get(context).changeProductTypeValue(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: AppMargin.m4),
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                    height: AppSize.s30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: StoreProductsCubit.get(context).productTypeFilterValue == index ?
                      ColorManager.primaryOrange :ColorManager.primaryGray,
                    ),
                    alignment: Alignment.center,
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