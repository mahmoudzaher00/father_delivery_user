import 'package:father_delivery_user/core/widgets/custom_image_widget.dart';
import 'package:father_delivery_user/features/restaurant/presentation/views/widgets/restaurant_map_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/utils/size_config.dart';

class RestaurantDetailsMapContainerWidget extends StatelessWidget {
  const RestaurantDetailsMapContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s230,
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal:AppSize.s14,vertical: AppSize.s8),
      color: ColorManager.whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomImage(
                ImageAssets.beak,
                isShadow: false,
                isNetwork: false,
                width: AppSize.s60,
                height: AppSize.s60,
              ),
              const SizedBox(width: AppSize.s10),
              Container(
                width: SizeConfig.screenWidth! - AppSize.s120,
                padding: const EdgeInsets.symmetric(vertical:AppSize.s8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("مطعم البيك",
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)
                        ),
                        Text("يبعد مسافة 2.2km",
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(color:ColorManager.primaryOrange)
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSize.s20),
                    Text('حي البيان , الرياض , المملكة العربية السعودية',
                      style: Theme.of(context).textTheme.displaySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSize.s20),
                    Text('من 12:00 مساءا إلي 20:00 صباحا',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(color:ColorManager.gray300),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSize.s10),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: 3.5,
                          unratedColor: Colors.grey,
                          itemBuilder: (context, index) => Icon(
                            index < 4 ? CupertinoIcons.star_fill: CupertinoIcons.star,
                            color: ColorManager.primaryOrange,
                          ),
                          itemCount: AppSize.s5i,
                          itemSize: AppSize.s14,
                          direction: Axis.horizontal,
                        ),
                        const SizedBox(width: AppSize.s4),
                        Text('3.6',
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(color:ColorManager.primaryOrange),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: AppSize.s4),
                        Text('(2.435 تقييم)',
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(color:ColorManager.gray300,fontSize: 10
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const RestaurantMapButton()
        ],
      ),
    );
  }
}