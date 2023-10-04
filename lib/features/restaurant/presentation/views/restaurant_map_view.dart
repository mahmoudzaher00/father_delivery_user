import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/core/utils/size_config.dart';
import 'package:father_delivery_user/core/widgets/custom_app_bar_widget.dart';
import 'package:father_delivery_user/core/widgets/custom_map_widget.dart';
import 'package:father_delivery_user/features/restaurant/presentation/views/widgets/restaurant_map_view_widgets/restaurant_details_map_container_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/app/di.dart';
import '../../../../core/core_cubit/map_cubit/map_cubit.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/values_manager.dart';

class RestaurantMapView extends StatefulWidget{
  const RestaurantMapView({super.key});

  @override
  State<RestaurantMapView> createState() => _RestaurantMapViewState();
}

class _RestaurantMapViewState extends State<RestaurantMapView> {

  @override
  void initState() {
    instance<MapCubit>().convertNetworkImageToMapMarker();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.pushReplacementNamed(context, Routes.restaurantRoute);
        return false;
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomMapWidget(
              mapHeight: SizeConfig.screenHeight! ,
              getMyLocation: false,
              borderRadius: BorderRadius.zero,
              showMarker: false,
              onTap: (latLng){
                instance<MapCubit>().convertNetworkImageToMapMarker();
              },
            ),
            Positioned(
              top: AppSize.s0, right: AppSize.s0, left: AppSize.s0,
              child: SafeArea(
                child: SizedBox(
                  height:AppSize.s60,
                  child: CustomAppBar(
                    appBarToolbarHeight: AppSize.s60,
                    appBarBackgroundColor: ColorManager.transparentColor,
                    leadingOnPressed: ()=>   Navigator.pushReplacementNamed(context, Routes.restaurantRoute),
                    titleContent: Text("المطعم",
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold)
                    ),
                   ),
                ),
              ),
            ),
            const RestaurantDetailsMapContainerWidget(),
           ],
        ),
      ),
    );
  }
}
