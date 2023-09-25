import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/container_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_image_widget.dart';
import '../../manager/store_products_cubit/store_products_cubit.dart';
import '../../manager/store_products_cubit/store_products_state.dart';

class PageViewBodyWidget extends StatelessWidget {
  const PageViewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreProductsCubit, StoreProductsState>(
      builder: (context, state) {
        return ListView.builder(
            padding: const EdgeInsets.only(top: AppSize.s10),
            shrinkWrap: true,
            itemCount: 13,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context,index){
              return Container(
                height: AppSize.s100,
                margin: const EdgeInsets.symmetric(vertical: AppMargin.m8,horizontal: AppMargin.m10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorManager.primaryGray,
                    boxShadow: ContainerManager.shadow
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: AppPadding.p8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: SizeConfig.screenWidth! - AppSize.s150,
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: 'موكسيتريكس',
                                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: ' - ',
                                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                        fontWeight: FontWeight.w500),
                                  ),
                                  TextSpan(
                                    text: '500 مجم',
                                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! - AppSize.s150,
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: 'مضاد حيوي',
                                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                    fontWeight: FontWeight.w500),
                                children: const <InlineSpan>[
                                  TextSpan(text: ' - '),
                                  TextSpan(text:'5 أقراص'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! - AppSize.s160,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text(StoreProductsCubit.get(context).productsCounts[index] ==0 ?'25.00 ر.س' :
                                    '${25.00 * StoreProductsCubit.get(context).productsCounts[index]} ر.س ',
                                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                        fontWeight: FontWeight.bold,fontSize: 14,color: ColorManager.primaryOrange)),
                                Container(
                                  width:  AppSize.s80,
                                  height:  AppSize.s26,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: StoreProductsCubit.get(context).productsCounts[index] == 0?
                                    ColorManager.gray500:ColorManager.primaryOrange),
                                    color: StoreProductsCubit.get(context).productsCounts[index] == 0?
                                    ColorManager.primaryGray: ColorManager.primaryOrange,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: (){
                                            StoreProductsCubit.get(context).incrementProductCount(index);
                                            },
                                          padding: EdgeInsets.zero,
                                          iconSize: AppSize.s20,
                                          visualDensity: const VisualDensity(vertical: -4,horizontal: -4),
                                          icon: Icon(CupertinoIcons.plus_circle,
                                              color: StoreProductsCubit.get(context).productsCounts[index] == 0?
                                              ColorManager.gray500: ColorManager.whiteColor)
                                      ),
                                      Text(StoreProductsCubit.get(context).productsCounts[index].toString(),
                                          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                              color: StoreProductsCubit.get(context).productsCounts[index] == 0?
                                              ColorManager.gray500:ColorManager.whiteColor)),
                                      IconButton(
                                          padding: EdgeInsets.zero,
                                          iconSize: AppSize.s20,
                                          visualDensity: const VisualDensity(vertical: -4,horizontal: -4),
                                          onPressed: (){
                                            StoreProductsCubit.get(context).decrementProductCount(index);
                                            },
                                          icon: Icon(CupertinoIcons.minus_circle,
                                              color: StoreProductsCubit.get(context).productsCounts[index] == 0?
                                              ColorManager.gray500: ColorManager.whiteColor)
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const CustomImage(
                      ImageAssets.medicine,
                      isNetwork: false,
                      height: AppSize.s100, width: AppSize.s120),
                  ]),
              );
        });
      });
  }
}