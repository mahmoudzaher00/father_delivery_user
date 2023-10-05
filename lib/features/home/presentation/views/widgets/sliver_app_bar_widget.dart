import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
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
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppMargin.m12,horizontal: AppMargin.m20),
        child: DecoratedBox(
          decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: ContainerManager.shadow,
        ),
          child: ElevatedButton(
            onPressed: ()=> instance<HomeCubit>().globalKey.currentState!.openDrawer(),
            style: ElevatedButton.styleFrom(
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              backgroundColor:ColorManager.whiteColor,
              surfaceTintColor: ColorManager.whiteColor,
              foregroundColor: ColorManager.gray300,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )
            ),
            child:  const Icon(Icons.menu,size: AppSize.s28, color: ColorManager.blackColor),
          ),
        ),
      ),

      actions: [
        Container(
          height: AppSize.s44,
          width: 96,
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
          decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: ContainerManager.shadow,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [

              IconButton(
                  onPressed: ()=>   Navigator.pushNamed(context, Routes.cartRoute),
                  padding: EdgeInsets.zero,
                  icon: Badge(
                      smallSize: 10,
                      backgroundColor: ColorManager.primaryOrange,
                      child: SvgPicture.asset(SvgAssets.shoppingCart,height: 24,)
                  )
              ),
              IconButton(
                  onPressed: ()=> Navigator.pushNamed(context, Routes.notificationRoute),
                  padding: EdgeInsets.zero,
                  iconSize: 26,
                  color: ColorManager.blackColor,
                  icon: const Icon(CupertinoIcons.bell, )
              ),

            ],
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(AppSize.s48),
        child: Theme(
          data: ThemeData(
            splashColor: ColorManager.extraLightOrange,


          ),
          child: TabBar(
            physics: const BouncingScrollPhysics(),
            controller: tabController,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(color: ColorManager.primaryOrange,width: 2),
               borderRadius: BorderRadius.zero,
            ),
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
      ),
    );
  }
}