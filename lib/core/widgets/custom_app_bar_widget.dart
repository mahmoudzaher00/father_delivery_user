import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleAppBar;
  const CustomAppBar({Key? key, required this.titleAppBar,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: ColorManager.blackColor,
              size: AppSize.s20,
            )),
        const SizedBox(
          width: AppSize.s2,
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppPadding.p4),
          child: Text(
            titleAppBar,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}



///Custom App Bar
class CustomAppBar2 extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Widget? titleContent;
  final Widget? leadingWidget;
  final bool automaticallyLeading;
  final List<Widget>? actionsWidgets;
  final Color? appBarBackgroundColor;
  final double? appBarToolbarHeight;
  final bool? centerTitle;
  final double? appElevation;
  final double? leadingWidth;
  final SystemUiOverlayStyle? systemOverlayStyle;
  CustomAppBar2({Key? key,
    this.titleContent,
    this.systemOverlayStyle ,
    this.leadingWidget,
    this.actionsWidgets,
    this.appBarBackgroundColor,
    this.appBarToolbarHeight,
    this.appElevation,
    this.automaticallyLeading = false,
    this.centerTitle,
    this.leadingWidth,

  }): preferredSize =  Size.fromHeight(appBarToolbarHeight!), super(key: key);

  @override
  Widget build(BuildContext context) {



    return AppBar(
      automaticallyImplyLeading: automaticallyLeading,
      title: titleContent,
      centerTitle: centerTitle ?? true,
      leading: leadingWidget ,
      actions: actionsWidgets,
      leadingWidth: leadingWidth ?? 65,
      elevation: appElevation?? 0,
      backgroundColor: appBarBackgroundColor ?? Colors.white,
      toolbarHeight: appBarToolbarHeight ?? 80,
      //systemOverlayStyle: systemOverlayStyle,

      // shape: ContinuousRectangleBorder(
      //   borderRadius: const BorderRadius.only(
      //     bottomLeft: const Radius.circular(80),
      //     bottomRight: Radius.circular(80),
      //   ),
      // ),
      // title: CircleAvatar(
      //   radius: 30,
      //   backgroundImage: AssetImage('images/2.png'),
      // ),
    );
  }

}

