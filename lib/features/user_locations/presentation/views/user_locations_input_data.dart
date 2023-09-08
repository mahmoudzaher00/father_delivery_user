import 'package:flutter/material.dart';

import '../../../../core/app/di.dart';
import '../../../../core/core_cubit/map_cubit/map_cubit.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/size_config.dart';
import '../../data/models/search_data_model.dart';
import '../../data/models/services_model.dart';

class UserLocationsInputData{
  //TODO:Initial Location input& dialogs
  List<ServicesModel> servicesList = [
    ServicesModel(title: 'مطاعم',image: SvgAssets.hamburger,index: 0),
    ServicesModel(title: 'المتاجر العامة',image: SvgAssets.storeIcon,index: 1),
    ServicesModel(title: 'طلب خاص',image: SvgAssets.openBox,index: 2),
  ];
  showSearchMenu({BuildContext? context,List<Result>? results,}){
    showMenu(
        context: context!,
        position: const RelativeRect.fromLTRB(AppSize.s10, AppSize.s102, AppSize.s10, 0),
        color: ColorManager.whiteColor,
        surfaceTintColor: ColorManager.whiteColor,
        constraints: BoxConstraints(
          minWidth: SizeConfig.screenWidth! - AppSize.s20 ,
          maxWidth: SizeConfig.screenWidth!,
          maxHeight:  AppSize.s400,
          minHeight:  AppSize.s200,
        ),
        items: List.generate(results!.length, (index) {
          return  PopupMenuItem(
              child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    instance<MapCubit>().goToSearchLocation(results[index].lat.toDouble(), results[index].lng.toDouble());
                    // controller!.goToSearchLocation(results[index].lat.toDouble(), results[index].lng.toDouble());
                  },
                  child: Text(results[index].name,style: Theme.of(context).textTheme.displaySmall)
              )
          );
        }
        )
    );
  }
}