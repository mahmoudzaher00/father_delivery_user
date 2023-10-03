import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';
import 'custom_restaurant_details_list_tile.dart';
import 'custom_restaurant_page_view_header.dart';

class CustomRestaurantSliverAppBar extends StatelessWidget {
  final PageController pageController;

  const CustomRestaurantSliverAppBar({super.key, required this.pageController,});

  @override
  Widget build(BuildContext context) {
   return SliverLayoutBuilder(
        builder: (BuildContext context, constraints) {
          final scrolled = constraints.scrollOffset > 0;
          return  SliverAppBar(
            floating: true,
            elevation:scrolled?0: 4,
            pinned: true,
            shadowColor: scrolled?ColorManager.primaryGray:ColorManager.transparentColor,
            toolbarHeight: 30,
            expandedHeight: 238,
            collapsedHeight:30 ,
            centerTitle: true,
            leadingWidth: 65,
            forceElevated: true,
            backgroundColor: ColorManager.whiteColor,
            title: Text('المطاعم', style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20.sp,)),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: const [
                  SizedBox(height: 70,),
                  CustomRestaurantDetailsListTile(),
                ],
              ),
            ),
            bottom:  PreferredSize(
              preferredSize: const Size.fromHeight(110.0),
              child: CustomRestaurantPageViewHeader(pageController: pageController,),
            ),
          );
  });
  }
}