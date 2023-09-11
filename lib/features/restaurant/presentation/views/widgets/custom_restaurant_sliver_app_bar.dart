import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import 'custom_restaurant_details_list_tile.dart';
import 'custom_restaurant_tab_bar.dart';

class CustomRestaurantSliverAppBar extends StatelessWidget {
  const CustomRestaurantSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 4,
      pinned: true,
      toolbarHeight: 50,
      expandedHeight: 230,
      centerTitle: true,
      leadingWidth: 65,
      forceElevated: true,
      backgroundColor: ColorManager.whiteColor,
      leading: FittedBox(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16, bottom: 0),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                elevation: 3,
                foregroundColor: ColorManager.shadowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: ColorManager.whiteColor,
                surfaceTintColor: ColorManager.whiteColor,
                minimumSize: const Size(54, 40)),
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: ColorManager.primaryBlack,
            ),
          ),
        ),
      ),
      title: Text('المطاعم', style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20.sp,)),
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: const [
            SizedBox(height: 70,),
            CustomRestaurantDetailsListTile(),
          ],
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: CustomRestaurantTabBar(),
      ),
    );
  }
}