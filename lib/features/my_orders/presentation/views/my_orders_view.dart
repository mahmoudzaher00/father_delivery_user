import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/features/my_orders/presentation/views/widgets/my_orders_view_body.dart';
import 'package:flutter/material.dart';
import '../manager/my_orders_cubit/my_orders_cubit.dart';

class MyOrdersView extends StatefulWidget{
  const MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView>  with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    instance<MyOrdersCubit>().tabController = TabController(length: AppSize.s3, vsync: this);
  }

  @override
  void dispose() {
    instance<MyOrdersCubit>().tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyOrdersViewBody(),
    );
  }
}





