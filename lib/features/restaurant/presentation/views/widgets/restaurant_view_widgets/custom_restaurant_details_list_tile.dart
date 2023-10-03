import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/routes_manager.dart';
import '../../../../../../core/widgets/custom_image_widget.dart';

class CustomRestaurantDetailsListTile extends StatelessWidget {
  const CustomRestaurantDetailsListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        leading: const CustomImage(
          image:ImageAssets.baki,
          isShadow: false,
          isNetwork: false,
          isAsset: true,
          isCircular: true,
          radiusCircleAvatar: 30,
        ),
        title:  Text('مطعم البيك',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 15.sp,
                color: ColorManager.primaryBlack
            )),
        contentPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingBarIndicator(
              rating:3,
              unratedColor: ColorManager.dividerColor,

              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: ColorManager.errorColor,
              ),
              itemCount: 5,
              itemSize: 18.h,
              direction: Axis.horizontal,
              itemPadding: EdgeInsets.only(top: 7,left: 1.w,right: 1.w,bottom: 4),
            ),
            Text('بروست و مسحب',style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 13.sp,
                color: ColorManager.primaryBlack
            ),)
          ],
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.restaurantMapRoute);
            },
            padding: EdgeInsets.zero,
            icon:
            const Icon(FontAwesomeIcons.mapLocationDot,color: ColorManager.primaryBlack,),
            iconSize: 20,
          ),
        ),
        shape: const Border(
          bottom: BorderSide(color: Color(0xffE4E4E4)),
          top: BorderSide(color: Color(0xffE4E4E4)),
        ),
      ),
    );
  }
}