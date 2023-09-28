import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_image_widget.dart';

class GeneralStoresView extends StatelessWidget{
  const GeneralStoresView({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: ListView.builder(
         padding: const EdgeInsets.only(top: AppSize.s10),
         itemCount: 10,
         itemBuilder: (context,index){
           return Container(
             height: AppSize.s80,
             margin: const EdgeInsets.symmetric(horizontal: AppMargin.m12,vertical: AppMargin.m10),
             padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8),
                 color: ColorManager.primaryGray,
                 boxShadow: ContainerManager.shadow
             ),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                     children: [
                       const CustomImage(
                         ImageAssets.beak,
                         isNetwork: false,
                         isShadow: false,
                         height: AppSize.s60, width: AppSize.s60
                       ),
                       const SizedBox(width: AppSize.s6),
                       Text('#37056221',
                         style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w500)
                     ),
                   ]),
                 Container(
                     height: AppSize.s24,
                     width: AppSize.s100,
                     padding: const EdgeInsets.all(AppPadding.p4),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(22),
                       color:  index == 0? ColorManager.lightGreen: ColorManager.lightOrange,
                     ),
                     child: FittedBox(
                       fit: BoxFit.scaleDown,
                       alignment: Alignment.center,
                       child: Text(
                         index == 0 ?
                         'في الطريق للمستقبل':'منتهي',
                         textAlign: TextAlign.center,
                         style: Theme.of(context).textTheme.displaySmall!.copyWith(
                             fontWeight: FontWeight.w500,
                             fontSize: 11, color: ColorManager.whiteColor
                         ),),
                     )
                 )
               ],
             ),
           );
         }),
     bottomNavigationBar: Container(
       height: AppSize.s100,
       width: SizeConfig.screenWidth,
       padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16,vertical: AppPadding.p10),
       decoration: BoxDecoration(
           color: ColorManager.whiteColor,
           boxShadow: ContainerManager.shadow
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("إجمالي الطلبات",style: Theme.of(context).textTheme.displayMedium!.copyWith(
                   fontWeight: FontWeight.bold
               )),
               Text("10",style: Theme.of(context).textTheme.displayMedium!.copyWith(color:ColorManager.primaryOrange)),
             ],
           ),
           const Divider(color:ColorManager.primaryGray),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("إجمالي المدفوعات",style: Theme.of(context).textTheme.displayMedium!.copyWith(
                   fontWeight: FontWeight.bold
               )),
               Text("2000 ر.س",style: Theme.of(context).textTheme.displayMedium!.copyWith(color:ColorManager.primaryOrange)),
             ],
           ),
         ],
       ),
     ),
   );
  }
}