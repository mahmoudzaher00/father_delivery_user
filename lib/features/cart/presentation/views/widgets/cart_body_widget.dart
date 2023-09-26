import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/container_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/size_config.dart';
import 'cart_list_widget.dart';

class CartBodyWidget extends StatelessWidget {
  const CartBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      margin: const EdgeInsets.all(AppSize.s12),
      decoration: BoxDecoration(
          color: ColorManager.primaryGray,
          borderRadius: BorderRadius.circular(8),
          boxShadow: ContainerManager.shadow
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSize.s12),
              child: Text("مطعم البيك",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold)),
            ),
            const Divider(color: Colors.white),
            const CartListWidget()
          ],
        ),
      ),
    );
  }
}

