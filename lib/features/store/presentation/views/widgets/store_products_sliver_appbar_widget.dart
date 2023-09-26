import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:flutter/material.dart';


class StoreProductsSliverAppBarWidget extends StatelessWidget {
  const StoreProductsSliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: AppSize.s70,
      leadingWidth: AppSize.s90,
      backgroundColor: ColorManager.whiteColor,
      title: Text("الصيدليات",style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold)),
      leading: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m16,horizontal: AppMargin.m20),
          decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(22),
            boxShadow: ContainerManager.shadow,
          ),
          child:const Icon(
            Icons.arrow_back,
            size: AppSize.s30,
            color: ColorManager.primaryBlack,
          ),
        ),
      ),
    );
  }
}

