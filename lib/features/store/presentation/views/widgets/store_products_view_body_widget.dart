import 'package:father_delivery_user/features/store/presentation/views/widgets/product_types_filter_list_widget.dart';
import 'package:father_delivery_user/features/store/presentation/views/widgets/store_products_page_view_widget.dart';
import 'package:father_delivery_user/features/store/presentation/views/widgets/store_products_search_widget.dart';
import 'package:father_delivery_user/features/store/presentation/views/widgets/store_products_sliver_appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/values_manager.dart';

class StoreProductsViewBodyWidget extends StatefulWidget {
  const StoreProductsViewBodyWidget({super.key});

  @override
  State<StoreProductsViewBodyWidget> createState() => _StoreProductsViewBodyWidgetState();
}

class _StoreProductsViewBodyWidgetState extends State<StoreProductsViewBodyWidget> {
  final PageController pageController = PageController(initialPage: 0,keepPage: false);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const StoreProductsSliverAppBarWidget(),
        const StoreProductsSearchWidget(),
        const SliverToBoxAdapter(child: SizedBox(height: AppSize.s20)),
        ProductTypesListWidget(pageController: pageController),
        StoreProductsPageViewWidget(pageController: pageController),
      ],
    );
  }
}