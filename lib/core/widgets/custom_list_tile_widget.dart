import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';

class CustomListTileWidget extends StatelessWidget {
  final String? listTileTitleText;
  final Widget? listTileLeadingIcon;
  final Widget? listTileTrailingWidget;
  final void Function()? listTileOnTap;
  const CustomListTileWidget({
    Key? key, this.listTileTitleText, this.listTileLeadingIcon, this.listTileTrailingWidget, this.listTileOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: listTileOnTap,
      visualDensity:  VisualDensity(vertical: -3.h),
      minLeadingWidth: 2,
      leading:listTileLeadingIcon,
      title: Text(listTileTitleText!,style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 13),),

      trailing: listTileTrailingWidget??const Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: ColorManager.gray400,
      ),
    );
  }
}
