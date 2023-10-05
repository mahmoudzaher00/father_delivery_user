import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/resources/routes_manager.dart';

class GeneralStoresView extends StatelessWidget{
  const GeneralStoresView({super.key});

  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(

     child: Column(
       children: [
         Container(
           margin: const EdgeInsets.only(right: AppMargin.m18,left:AppMargin.m18,top: AppMargin.m18,bottom: AppMargin.m12),
           padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
           decoration:  BoxDecoration(
             color: ColorManager.primaryGray,
             borderRadius: BorderRadius.circular(12),
             boxShadow: ContainerManager.shadow
           ),
           child: Wrap(
               children: List.generate(12,(index){
                 return InkWell(
                     onTap: (){
                       Navigator.pushNamed(context, Routes.storeRoute);
                     },
                     child: Container(
                       width: MediaQuery.of(context).size.width * 0.3333 - AppSize.s20,
                       height: AppSize.s120,
                       margin: const EdgeInsets.symmetric(horizontal: AppMargin.m4, vertical: AppMargin.m1),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Container(
                             width: AppSize.s70,
                             height: AppSize.s70,
                             padding: const EdgeInsets.all(AppPadding.p16),
                             decoration: const BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: ColorManager.whiteColor
                             ),
                             child: SvgPicture.asset(SvgAssets.hamburger),
                           ),
                           FittedBox(
                             fit: BoxFit.scaleDown, // Choose the desired fit option
                             alignment: Alignment.center,
                             child: Text("توصيل طابعة",
                                 style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold)
                             ),
                           ),
                         ],
                       ),
                     )
                 );
               })
           ),
         ),
       ],
     ),
   );
  }
}