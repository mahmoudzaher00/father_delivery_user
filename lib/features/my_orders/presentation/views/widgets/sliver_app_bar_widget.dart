import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:flutter/material.dart';


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
      title: Text("طلباتي",style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold)),
      leading: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m16,horizontal: AppMargin.m20),
          decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: ContainerManager.shadow,
          ),
          child:const Icon(
            Icons.arrow_back,
            size: 30,
            color: ColorManager.primaryBlack,
          ),
        ),
      ),
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