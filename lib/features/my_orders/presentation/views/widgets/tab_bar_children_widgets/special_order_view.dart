import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resources/routes_manager.dart';
import '../../../../../../core/widgets/custom_order_count_payment_widget.dart';

class SpecialOrderView extends StatelessWidget{
  const SpecialOrderView({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: ListView.builder(
       padding: const EdgeInsets.only(top: AppSize.s10),
         itemCount: 10,
         itemBuilder: (context,index){
           return Padding(
             padding: const EdgeInsets.symmetric(horizontal: AppMargin.m20,vertical: AppMargin.m10),
             child: ElevatedButton(
               onPressed: (){
                 Navigator.pushNamed(context, Routes.ordersRoute);
               },
               style: ElevatedButton.styleFrom(
                   backgroundColor:  ColorManager.primaryGray,
                   surfaceTintColor: ColorManager.primaryGray,
                   foregroundColor:  ColorManager.borderColor,
                   elevation: 2,
                   // shadowColor: ColorManager.shadowColor,
                   padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12,vertical: AppPadding.p12),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(8),
                   )
               ),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   SizedBox(
                     width: SizeConfig.screenWidth!  - AppSize.s184,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("توصيل طابعة" ,
                             style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold).copyWith(
                               fontSize: 14
                             ),
                           overflow: TextOverflow.ellipsis,
                         ),
                         const SizedBox(height: AppSize.s10),
                         Text('#37056221',
                             style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w500)
                         )
                       ],
                     ),
                   ),
                   Container(
                     height: AppSize.s24,
                     width: AppSize.s120,
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
             ),
           );
         }),
     bottomNavigationBar: const CustomOrderCountAndPaymentWidget(orderCounts: '9', orderTotalPayment: 2000),
   );
  }
}