// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:gorilla/features/map/presentation/manager/map_bloc/map_bloc.dart';
//
//
// import '../app/di.dart';
// import '../resources/map_manager.dart';
// import '../resources/values_manager.dart';
// import '../utils/size_config.dart';
//
// class CustomMapWidget extends StatelessWidget {
//   final double? mapWidth;
//   final double? mapHeight;
//   final ArgumentCallback<LatLng>? onTap;
//   final BorderRadius? borderRadius;
//   final bool? showMarker;
//
//   const CustomMapWidget({Key? key,  this.mapWidth,  this.mapHeight,  this.onTap, this.showMarker=true,  this.borderRadius,}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MapBloc, MapState>(
//       builder: (context, state) {
//         return ClipRRect(
//           borderRadius: borderRadius??BorderRadius.circular(AppSize.s8),
//           child: SizedBox(
//             width: mapWidth??SizeConfig.screenWidth,
//             height: mapHeight??120.h,
//             child: GoogleMap(
//               initialCameraPosition: instance<MapBloc>().cameraPosition(),
//               mapType: MapType.normal,
//               onTap: onTap??(l){
//                 if (kDebugMode) {
//                   print(l);
//                 }
//               },
//               onMapCreated: (GoogleMapController googleMapController) {
//                 // instance<MapCubit>().completer.complete(googleMapController);
//                 // _completer.complete(googleMapController);
//                 instance<MapBloc>().mapController=googleMapController;
//                 googleMapController.setMapStyle(MapManager.mapStyle);
//               },
//               onCameraMove: (c){
//                 if (kDebugMode) {
//                   print(c);
//                 }
//               },
//               markers:showMarker!? instance<MapBloc>().mapMarker:instance<MapBloc>().emptyMarker,
//               zoomControlsEnabled: false,
//               // myLocationEnabled: true,
//               zoomGesturesEnabled: true,
//               scrollGesturesEnabled: true,
//               compassEnabled: false,
//
//
//             ),
//           ),
//         );
//       },
//     );
//   }
//
// }
