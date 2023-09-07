import 'package:father_delivery_user/features/map/presntation/manager/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({super.key,required this.controller});
  final MapCubit controller;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: MapCubit.initialPosition,
      markers: {controller.marker},
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController googleMapController) {
        controller.googleMapCompleter.complete(googleMapController);
        controller.mapController = googleMapController;
        controller.getMyLocation(context);
      },
      onTap: (latLong) {
        controller.getLocationByTapping(latLong);
      },
    );
  }
}