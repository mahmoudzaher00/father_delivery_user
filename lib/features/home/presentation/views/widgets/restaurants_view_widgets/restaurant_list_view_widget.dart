import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_image_widget.dart';
import 'package:father_delivery_user/features/home/presentation/views/widgets/restaurants_view_widgets/tooltip_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/routes_manager.dart';
import '../../../manager/home_cubit/home_cubit.dart';
import '../../../manager/home_cubit/home_state.dart';

class RestaurantListViewWidget extends StatelessWidget {
  const RestaurantListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(top: AppSize.s10),
        shrinkWrap: true,
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppMargin.m10,vertical: AppMargin.m10),
            child: ElevatedButton(
              onPressed: () {   Navigator.pushNamed(context, Routes.restaurantRoute); },
              style: ElevatedButton.styleFrom(
                  backgroundColor:  ColorManager.primaryGray,
                  surfaceTintColor:  ColorManager.primaryGray,
                  shadowColor:  ColorManager.primaryGray,
                  foregroundColor:  ColorManager.borderColor,
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10,vertical: AppPadding.p10),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomImage(
                    image:ImageAssets.baik,
                    isNetwork: false,
                    isShadow: false,
                    height: AppSize.s60,
                    width: AppSize.s60,
                  ),
                  const SizedBox(width: AppSize.s10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppSize.s30,
                        width: SizeConfig.screenWidth! - AppSize.s110,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('مطعم البيك',
                                  style: Theme.of(context).textTheme.displayMedium!.
                                  copyWith(fontWeight: FontWeight.bold,fontSize: 15),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(width: AppSize.s10),
                              const TooltipWidget(),
                              const Spacer(),
                              BlocBuilder<HomeCubit, HomeState>(
                                builder: (context, state) {
                                  return InkWell(
                                    onTap: (){
                                      HomeCubit.get(context).changeFavouriteIconStatus(index);
                                      },
                                    child: Icon(
                                        HomeCubit.get(context).favouriteList[index]?
                                        CupertinoIcons.heart_fill:CupertinoIcons.heart,
                                        color: HomeCubit.get(context).favouriteList[index]?
                                        ColorManager.primaryOrange:ColorManager.gray700
                                    ),
                                  );
                                  }),
                            ]
                        ),
                      ),
                      const SizedBox(height: AppSize.s6),
                      Text('بروست و مسحب',
                          style: Theme.of(context).textTheme.displaySmall!.
                          copyWith(fontWeight: FontWeight.w500)
                      ),
                      const SizedBox(height: AppSize.s6),
                      SizedBox(
                         width: SizeConfig.screenWidth! - 110,
                         child: RichText(
                           overflow: TextOverflow.ellipsis,
                           text: TextSpan(
                             text: 'حى البيان , الرياض',
                             style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 13),
                             children: <InlineSpan>[
                               const WidgetSpan(
                                   alignment: PlaceholderAlignment.baseline,
                                   baseline: TextBaseline.alphabetic,
                                   child: SizedBox(width: AppSize.s10)),
                               TextSpan(
                                 text: 'يبعد مسافة (3.0 km)',
                                 style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w500),
                               ),
                             ],
                           ),
                         ),
                       ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

