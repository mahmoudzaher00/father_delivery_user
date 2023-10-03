import 'package:father_delivery_user/features/orders/presentation/manager/new_order_cubit/new_order_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app/di.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../orders_input_data.dart';

class CustomPickedImageListView extends StatelessWidget {
  final bool deleteImage;
  const CustomPickedImageListView({super.key, this.deleteImage=true,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewOrderCubit, NewOrderState>(
      bloc: instance<NewOrderCubit>(),
      builder: (context, state) {
        if (instance<OrdersInputData>().imageList.isNotEmpty) {
          if(deleteImage) {
            return SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView.separated(
                  padding: EdgeInsets.only(top: 12.h),
                  scrollDirection: Axis.horizontal,
                  itemCount: instance<OrdersInputData>().imageList.length,
                  separatorBuilder: (context, index) =>const Padding(padding: EdgeInsetsDirectional.only(end: 15,)) ,
                  itemBuilder:  (context, index) =>
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorManager.whiteColor,

                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: SizedBox(
                                  height: 12,
                                  width: 12,
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      visualDensity: const VisualDensity(horizontal: -4,vertical: -4),
                                      onPressed: () {
                                        instance<NewOrderCubit>().deleteImage(index);
                                      },
                                      icon: const Icon(CupertinoIcons.xmark_circle,size: 12,
                                      color: ColorManager.errorColor,)),
                                )),
                            const Icon(CupertinoIcons.photo,size: 20,color: ColorManager.throughLineColor,)
                            // Image.file(instance<OrdersInputData>().imageList[index],height: 0,width: 20,)
                          ],
                        ),
                      )
                //       CircleAvatar(
                //   foregroundImage: FileImage((instance<OrdersInputData>().imageList[index]),
                // ),),
              )
          );
          }else{
            return SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.separated(
                    padding:  EdgeInsetsDirectional.symmetric(vertical: 12.h,horizontal: 20,),
                    scrollDirection: Axis.horizontal,
                    itemCount: instance<OrdersInputData>().imageList.length,
                    separatorBuilder: (context, index) =>const Padding(padding: EdgeInsetsDirectional.only(end: 15,)) ,
                    itemBuilder:  (context, index) =>
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorManager.whiteColor,

                          ),
                          child: const Icon(CupertinoIcons.photo,size: 20,color: ColorManager.throughLineColor,),
                        )
                  //       CircleAvatar(
                  //   foregroundImage: FileImage((instance<OrdersInputData>().imageList[index]),
                  // ),),
                )
            );
          }
        }else{
          return const SizedBox.shrink();
        }
  },
);
  }
}
