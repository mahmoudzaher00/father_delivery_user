import 'package:father_delivery_user/core/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/color_manager.dart';




///Custom App Bar
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Widget? titleContent;
  final Widget? leadingWidget;
  final bool? automaticallyLeading;
  final List<Widget>? actionsWidgets;
  final Color? appBarBackgroundColor;
  final double? appBarToolbarHeight;
  final bool? centerTitle;
  final double? appElevation;
  final  void Function()?  leadingOnPressed;
  final SystemUiOverlayStyle? systemOverlayStyle;
  
  CustomAppBar({Key? key, this.titleContent,this.systemOverlayStyle=Constants.systemUiOverlayStyleDark ,this.leadingWidget,this.actionsWidgets,this.appBarBackgroundColor,this.appBarToolbarHeight,this.appElevation, this.automaticallyLeading=false,this.centerTitle, this.leadingOnPressed}): preferredSize =  Size.fromHeight(appBarToolbarHeight!), super(key: key);

  @override
  Widget build(BuildContext context) {



    return AppBar(
      automaticallyImplyLeading: automaticallyLeading!,
      title: titleContent,
      centerTitle: centerTitle??true,
      leading: leadingWidget??FittedBox(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16, bottom: 0),
          child: ElevatedButton(
            onPressed: leadingOnPressed??()=>Navigator.pop(context),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                elevation: 3,
                foregroundColor: ColorManager.shadowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: ColorManager.whiteColor,
                surfaceTintColor: ColorManager.whiteColor,
                minimumSize: const Size(54, 40)),
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: ColorManager.primaryBlack,
            ),
          ),
        ),
      ) ,
      actions: actionsWidgets,
      leadingWidth: 65,
      elevation: appElevation??0,
      backgroundColor: appBarBackgroundColor??Colors.white,
      toolbarHeight:appBarToolbarHeight??80,
      systemOverlayStyle: systemOverlayStyle,

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

