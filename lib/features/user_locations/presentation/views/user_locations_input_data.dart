import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        position:
        // results!.isEmpty?
        // RelativeRect.fromLTRB(
        //   (SizeConfig.screenWidth! - SizeConfig.screenWidth!* 0.5) / 2, // Center horizontally
        //   AppSize.s102,
        //   (SizeConfig.screenWidth! - SizeConfig.screenWidth!* 0.5) / 2, // Center horizontally
        //   0,
        // ):
        const RelativeRect.fromLTRB(AppSize.s10, AppSize.s102, AppSize.s10, 0),
        color: ColorManager.whiteColor,
        surfaceTintColor: ColorManager.whiteColor,
        constraints: BoxConstraints(
          // minWidth: results.isEmpty?SizeConfig.screenWidth!* 0.5:SizeConfig.screenWidth! - AppSize.s20 ,
          minWidth: SizeConfig.screenWidth! - AppSize.s20 ,
          // maxWidth:  results.isEmpty?SizeConfig.screenWidth!* 0.5:SizeConfig.screenWidth!,
          maxWidth: SizeConfig.screenWidth!,
          maxHeight:  results!.isEmpty?90:AppSize.s400,
          minHeight: results.isEmpty?90: AppSize.s200,
        ),
        items: results.isEmpty?List.generate(1, (index) => PopupMenuItem(
            child: SizedBox(
                width: SizeConfig.screenWidth,
                height: AppSize.s30,
                child: Text('لا يوجد نتائج مطابقة',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 14.sp,),))
        ))
            :List.generate(results.length, (index) {
          return  PopupMenuItem(
              child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    instance<MapCubit>().goToSearchLocation(results[index].lat.toDouble(), results[index].lng.toDouble());
                    // controller!.goToSearchLocation(results[index].lat.toDouble(), results[index].lng.toDouble());
                  },
                  child: SizedBox(
                      width: SizeConfig.screenWidth,
                      height: AppSize.s30,
                      child: Text(results[index].name,style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 14.sp,)))
              )
          );
        }
        )
    );
  }
}