import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/resources/container_manager.dart';
import 'package:father_delivery_user/core/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_order_info_details_widget.dart';
import 'custom_order_state_sliver_list_view.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      margin: EdgeInsets.symmetric(vertical: 16.h,horizontal:20.w),
      decoration: BoxDecoration(
          color: ColorManager.primaryGray,
          boxShadow: ContainerManager.shadow,
          borderRadius: BorderRadius.circular(5)
      ),
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const CustomImage(
                        image:ImageAssets.baki,
                        radiusCircleAvatar: 30,
                        isAsset: true,
                        isCircular: true,
                        isShadow: false,

                      ),
                      const SizedBox(width: 20,),
                      Text('مطعم البيك',
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 16.sp,
                        ),)
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                const Divider(color: ColorManager.whiteColor,thickness: 2,),
                SizedBox(height: 12.h,),
                const CustomOrderInfoDetailsWidget(),
                const Divider(color: ColorManager.whiteColor,thickness: 2,),
                // const CustomOrderStateListView()


              ],
            ),
            ),
          const CustomOrderStateSliverList()

        ],
      )

    );
  }
}







