import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/routes_manager.dart';

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
          return InkWell(
            onTap: (){
              Navigator.pushNamed(context, Routes.ordersRoute);
            },
            child: Container(
              height: AppSize.s80,
              margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10,vertical: AppMargin.m10),
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10,vertical: AppPadding.p10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorManager.primaryGray,
                  boxShadow: ContainerManager.shadow
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomImage(
                    image:ImageAssets.beak,
                    isNetwork: false,
                    isShadow: false,
                    height: AppSize.s60,
                    width: AppSize.s60,
                  ),
                  const SizedBox(width: AppSize.s10),
                  SizedBox(
                    height: AppSize.s30,
                    width: SizeConfig.screenWidth! - AppSize.s110,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('مطعم البيك',
                              overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.displayMedium!.
                            copyWith(fontWeight: FontWeight.bold,fontSize: 15)),
                          Container(
                            width: 20,
                            height: 20,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: ColorManager.whiteColor,
                              shape: BoxShape.circle
                            ),
                            child: Text("9",style: Theme.of(context).textTheme.displaySmall!.copyWith(
                              fontWeight: FontWeight.bold
                            )),
                          )

                        ]),
                  ),
                ]),
            ),
          );
        });
  }
}

