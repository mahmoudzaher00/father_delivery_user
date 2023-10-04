import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



import '../app/di.dart';
import '../core_cubit/map_cubit/map_cubit.dart';
import '../resources/values_manager.dart';
import '../utils/size_config.dart';

class CustomMapWidget extends StatelessWidget {
  final double? mapWidth;
  final double? mapHeight;
  final ArgumentCallback<LatLng>? onTap;
  final BorderRadius? borderRadius;
  final bool? showMarker;
  final bool? getMyLocation;
  final MapCreatedCallback? onMapCreated;


  const CustomMapWidget({Key? key,  this.mapWidth,  this.mapHeight,  this.onTap, this.showMarker=true,  this.borderRadius, this.getMyLocation=true, this.onMapCreated, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: borderRadius??BorderRadius.circular(AppSize.s8),
          child: SizedBox(
            width: mapWidth??SizeConfig.screenWidth,
            height: mapHeight??120.h,
            child: GoogleMap(
              initialCameraPosition: instance<MapCubit>().initialPosition(),
              mapType: MapType.normal,

              onTap: onTap??(latLng){
                instance<MapCubit>().getLocationDetailsByTapping(latLng);
                //instance<MapCubit>().getLatLngOnMap(latLng);
                if (kDebugMode) {
                  print(latLng);
                }
              },
              onMapCreated: onMapCreated??(GoogleMapController googleMapController) {
                // if (!MapCubit.get(context).googleMapCompleter.isCompleted) {
                //   MapCubit.get(context).googleMapCompleter.complete(googleMapController);
                // }
                instance<MapCubit>().googleMapCompleter = Completer<GoogleMapController>();
                instance<MapCubit>().googleMapCompleter!.complete(googleMapController);
                instance<MapCubit>().mapController = googleMapController;
                if(getMyLocation!) {
                  instance<MapCubit>().getMyLocation(context);
                }

                // googleMapController.setMapStyle(MapManager.mapStyle);
              },
              onCameraMove: (c){
                if (kDebugMode) {
                  print(c);
                }
              },
              markers:showMarker!? {instance<MapCubit>().marker} :instance<MapCubit>().emptyMarker,
              zoomControlsEnabled: false,
              // myLocationEnabled: true,
              zoomGesturesEnabled: true,
              scrollGesturesEnabled: true,
              compassEnabled: false,


            ),
          ),
        );
      },
    );
  }

}
