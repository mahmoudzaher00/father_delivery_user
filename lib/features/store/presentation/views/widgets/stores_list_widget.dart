import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/container_manager.dart';
import '../../../../../core/resources/routes_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_image_widget.dart';
import '../../manager/store_cubit/store_cubit.dart';

class StoresListWidget extends StatelessWidget {
  const StoresListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, Routes.storeProductsRoute);
        },
        child: ListView.builder(
            padding: const EdgeInsets.only(top: AppSize.s10),
            shrinkWrap: true,
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context,index){
              return Container(
                height: AppSize.s80,
                margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10,vertical: AppMargin.m8),
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10,vertical: AppPadding.p10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorManager.primaryGray,
                    boxShadow: ContainerManager.shadow
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: AppSize.s60,
                      height: AppSize.s60,
                      padding: const EdgeInsets.all(AppPadding.p8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.whiteColor
                      ),
                      child: const CustomImage(
                        image:ImageAssets.pharmacy,
                        isNetwork: false,
                        isShadow: false,
                      ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('صحة زينه',
                                  style: Theme.of(context).textTheme.displayMedium!.
                                  copyWith(fontWeight: FontWeight.bold,fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                BlocBuilder<StoreCubit, StoreState>(
                                  builder: (context, state) {
                                    return InkWell(
                                      onTap: (){
                                        StoreCubit.get(context).changeFavouriteIconStatus(index);
                                        },
                                      child: Icon(
                                          StoreCubit.get(context).favouriteList[index]?
                                          Icons.favorite:Icons.favorite_border,
                                          color: StoreCubit.get(context).favouriteList[index]?
                                          ColorManager.primaryOrange:ColorManager.gray700
                                      ),
                                    );
                                  })
                              ]
                          ),
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
              );
            }),
      ),
    );
  }
}