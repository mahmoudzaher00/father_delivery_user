import 'package:father_delivery_user/core/app/di.dart';
import 'package:father_delivery_user/core/core_cubit/generic_cubit/generic_cubit.dart';
import 'package:father_delivery_user/features/orders/presentation/views/orders_input_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/color_manager.dart';

class CustomDeliveryTimeCounterWidget extends StatelessWidget {
  const CustomDeliveryTimeCounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<int>, GenericState<int>>(
      bloc: instance<OrdersInputData>().timeCount,
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(22),
              color: ColorManager.primaryOrange),
          child: Row(
            children: [
              IconButton(
                  onPressed: () => instance<OrdersInputData>().timeCount.update(data: state.data! + 1),
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  visualDensity:
                      const VisualDensity(vertical: -4, horizontal: -4),
                  tooltip: 'اضافة',
                  color: ColorManager.whiteColor,
                  icon: const Icon(Icons.add_circle_outline)),
              const SizedBox(
                width: 12,
              ),
              Text(state.data.toString(),
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 14.sp, color: ColorManager.whiteColor)),
              const SizedBox(
                width: 12,
              ),
              IconButton(
                  onPressed: () {
                    if (state.data! > 1) {
                      instance<OrdersInputData>().timeCount.update(data: state.data! - 1);
                    }
                  },
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  tooltip: 'انقاص',
                  visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                  color: ColorManager.whiteColor,
                  icon: const Icon(Icons.remove_circle_outline)),
            ],
          ),
        );
      },
    );
  }
}
