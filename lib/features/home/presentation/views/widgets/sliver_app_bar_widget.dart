import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/app/di.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/routes_manager.dart';
import '../../manager/home_cubit/home_cubit.dart';

class SliverAppBarWidget extends StatelessWidget {
  final bool? forceElevated;
  final TabController? tabController;
  const SliverAppBarWidget({super.key,this.tabController, this.forceElevated});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      centerTitle: true,
      pinned: true,
      forceElevated: forceElevated!,
      elevation: 0,
      toolbarHeight: AppSize.s70,
      leadingWidth: AppSize.s90,
      backgroundColor: ColorManager.whiteColor,
      title: Container(
        height: AppSize.s50,
        width: AppSize.s50,
        padding: const EdgeInsets.all(AppPadding.p8),
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          shape: BoxShape.circle,
          boxShadow: ContainerManager.shadow,
        ),
        child: SvgPicture.asset(SvgAssets.splashBike),
      ),
      leading: InkWell(
        onTap: (){
          instance<HomeCubit>().globalKey.currentState!.openDrawer();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12,horizontal: AppMargin.m20),
          decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: ContainerManager.shadow,
          ),
          child: const Icon(Icons.menu,size: AppSize.s28, color: ColorManager.blackColor),
        ),
      ),
      actions: [
        Container(
          height: AppSize.s44,
          width: AppSize.s90,
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
          decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: ContainerManager.shadow,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
              InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.cartRoute);
                    },
                  child: SvgPicture.asset(SvgAssets.shoppingCart)
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, Routes.notificationRoute);
                },
                child: const Icon(Icons.notifications_none_outlined,
                  size: AppSize.s28,
                  color: ColorManager.blackColor,
                ),
              )
            ],
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(AppSize.s48),
        child: TabBar(
          physics: const BouncingScrollPhysics(),
          controller: tabController,
          labelColor:ColorManager.primaryOrange,
          unselectedLabelColor:ColorManager.primaryOrange30,
          indicatorColor:ColorManager.primaryOrange,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
          dividerColor: Colors.transparent,
          labelStyle: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: "المطاعم"),
            Tab(text: "المتاجر العامة"),
            Tab(text: "الطلبات الخاصة"),
          ],
        ),
      ),
    );
  }
}