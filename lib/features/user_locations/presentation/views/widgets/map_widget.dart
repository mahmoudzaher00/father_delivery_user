// import 'package:father_delivery_user/features/map/presntation/manager/tracking_map_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class GoogleMapWidget extends StatelessWidget {
//   const GoogleMapWidget({super.key,});
//   // final MapCubit controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       initialCameraPosition: MapCubit.initialPosition,
//       markers: { context.read<MapCubit>().marker},
//       myLocationButtonEnabled: false,
//       zoomControlsEnabled: false,
//       onMapCreated: (GoogleMapController googleMapController) {
//         context.read<MapCubit>().googleMapCompleter.complete(googleMapController);
//         context.read<MapCubit>().mapController = googleMapController;
//         context.read<MapCubit>().getMyLocation(context);
//       },
//       onTap: (latLong) {
//         context.read<MapCubit>().getLocationByTapping(latLong);
//       },
//     );
//   }
// }