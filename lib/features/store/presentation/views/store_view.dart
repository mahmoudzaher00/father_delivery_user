import 'package:father_delivery_user/features/store/presentation/views/widgets/store_app_bar_widget.dart';
import 'package:father_delivery_user/features/store/presentation/views/widgets/store_search_widget.dart';
import 'package:father_delivery_user/features/store/presentation/views/widgets/stores_list_widget.dart';
import 'package:flutter/material.dart';


class StoreView extends StatelessWidget{
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          StoreAppBarWidget(),
          StoreSearchWidget(),
          StoresListWidget()
        ],
      )
    );
  }

}








