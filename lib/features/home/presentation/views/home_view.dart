import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/features/home/presentation/views/widgets/drawer_widget.dart';
import 'package:father_delivery_user/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import '../manager/home_cubit/home_cubit.dart';

class HomeView extends StatefulWidget{
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>  with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    instance<HomeCubit>().tabController = TabController(length: AppSize.s3, vsync: this);
  }

  @override
  void dispose() {
    instance<HomeCubit>().tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      key: instance<HomeCubit>().globalKey,
      drawer: const DrawerWidget(),
      body: const HomeViewBody(),
    );
  }
}





