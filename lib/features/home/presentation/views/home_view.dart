import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/features/home/presentation/views/widgets/drawer_widget.dart';
import 'package:father_delivery_user/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        drawerScrimColor: Colors.transparent,
        key: instance<HomeCubit>().globalKey,
        drawer: const DrawerWidget(),
        body: const HomeViewBody(),
      ),
    );
  }
}

DateTime? currentBackPressTime;
Future<bool> _onWillPop() {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 5)) {
    currentBackPressTime = now;
    Fluttertoast.showToast(
      msg: "اضغط مره اخري للخروج من التطبيق",
      backgroundColor: ColorManager.lightOrange,
      textColor: ColorManager.whiteColor,
      toastLength: Toast.LENGTH_SHORT,
    );
    return Future.value(false);
  }
  return Future.value(true);
}



