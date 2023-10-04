import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_image_widget.dart';
import '../../manager/cart_cubit.dart';

class CartListItemWidget extends StatelessWidget {
  final int index;
  const CartListItemWidget({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s66,
      child: Row(
        children:  [
          CustomImage(
            image:ImageAssets.baik,
            radiusCircleAvatar: AppSize.s28,
            circleBorderColor:
            CartCubit.get(context).cartList[index].productCount == CartCubit.get(context).productCounts[index]?
            ColorManager.grayIcon:ColorManager.primaryOrange,
            isNetwork: false, isShadow: false,
            isAsset: true,
            isCircular: true,
          ),
          const SizedBox(width: AppSize.s10),
          SizedBox(
            width: SizeConfig.screenWidth!  - AppSize.s190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(CartCubit.get(context).cartList[index].productName!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color:
                    CartCubit.get(context).cartList[index].productCount == CartCubit.get(context).productCounts[index]?
                    ColorManager.gray700:ColorManager.blackColor,
                    )),
                CartCubit.get(context).cartList[index].productDescription != null?
                Text(CartCubit.get(context).cartList[index].productDescription! ,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color:ColorManager.gray700)
                ):const SizedBox.shrink(),
                Row(
                  children: [
                    Text((CartCubit.get(context).cartList[index].productPrice! *
                        CartCubit.get(context).productCounts[index]).toString(),
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(color:ColorManager.gray700)
                    ),
                    Text(' ر.س ',
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(color:ColorManager.gray700)
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.topCenter,
                  iconSize: AppSize.s20,
                  visualDensity: const VisualDensity(vertical: -4,horizontal: -4),
                  onPressed: (){
                    CartCubit.get(context).deleteProductFromCart(index);
                  },
                  icon: const Icon(CupertinoIcons.xmark_circle,color: ColorManager.gray500)
              ),
              Container(
                width:  AppSize.s80,
                height:  AppSize.s30,
                decoration: BoxDecoration(
                  color: CartCubit.get(context).cartList[index].productCount == CartCubit.get(context).productCounts[index]?
                  ColorManager.gray500:ColorManager.primaryOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: (){
                          CartCubit.get(context).incrementProductCount(index);
                        },
                        padding: EdgeInsets.zero,
                        iconSize: AppSize.s20,
                        visualDensity: const VisualDensity(vertical: -4,horizontal: -4),
                        icon: const Icon(CupertinoIcons.plus_circle,color: ColorManager.whiteColor)
                    ),
                    Text(CartCubit.get(context).productCounts[index].toString(),
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(color:ColorManager.whiteColor)),
                    IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: AppSize.s20,
                        visualDensity: const VisualDensity(vertical: -4,horizontal: -4),
                        onPressed: (){
                          CartCubit.get(context).decrementProductCount(index);
                        },
                        icon: const Icon(CupertinoIcons.minus_circle,color: ColorManager.whiteColor)
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}