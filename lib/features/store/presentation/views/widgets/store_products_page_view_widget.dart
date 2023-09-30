import 'package:father_delivery_user/features/store/presentation/manager/store_products_cubit/store_products_cubit.dart';
import 'package:father_delivery_user/features/store/presentation/views/widgets/page_view_body_widget.dart';
import 'package:flutter/material.dart';


class StoreProductsPageViewWidget extends StatelessWidget {
  final PageController pageController;
  const StoreProductsPageViewWidget({super.key,required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: true,
      controller: pageController,
      physics: const BouncingScrollPhysics(),
      onPageChanged: (index) {
        StoreProductsCubit.get(context).changeProductTypeValue(index);
      },
      children: StoreProductsCubit.get(context).productsTypeList.map((String string) {
        return const PageViewBodyWidget();
      }).toList(),
    );
  }
}