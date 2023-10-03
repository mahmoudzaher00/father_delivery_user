// import 'dart:async';
// import 'dart:collection';
// import 'dart:developer';
// import 'dart:ui' as ui;
// import 'package:father_delivery_user/core/app/constants.dart';
// import 'package:father_delivery_user/core/app/di.dart';
// import 'package:father_delivery_user/core/resources/assets_manager.dart';
// import 'package:father_delivery_user/core/utils/api_service_1.dart';
// import 'package:father_delivery_user/features/map/data/search_data_model.dart';
// import 'package:father_delivery_user/features/map/data/services_model.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
//
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'tracking_map_state.dart';
// import 'package:geocoding/geocoding.dart' as geocoding;
//
// class MapCubit extends Cubit<MapState> {
//   MapCubit() : super(MapInitial());
//   var mapMarker = HashSet<Marker>();
//   var emptyMarker = HashSet<Marker>();
//   final Completer<GoogleMapController> googleMapCompleter = Completer<GoogleMapController>();
//   BitmapDescriptor? customMarker;
//   Uint8List? markerImage;
//   Position? currentPosition;
//   CameraPosition? cameraPosition;
//   double mapZoom = 14;
//   GoogleMapController? mapController ;
//   String? zoneAddress;
//
//   CameraPosition initialPosition() =>
//       const CameraPosition(target: LatLng(26.565191, 49.996376), zoom: 14);
//
//   Future<Uint8List> getBytesFromAsset(String path, int width) async {
//     ByteData data = await rootBundle.load(path);
//     ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
//     ui.FrameInfo fi = await codec.getNextFrame();
//     return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
//   }
//
//   getCustomMarker() async {
//     final Uint8List markerIcon = await getBytesFromAsset(ImageAssets.mapMarker, 80.w.toInt());
//     customMarker = BitmapDescriptor.fromBytes(markerIcon);
//     mapMarker.add(Marker(
//       markerId: const MarkerId('1'),
//       position: const LatLng(26.565191, 49.996376),
//       icon: customMarker!,
//     ));
//     emit(GetCustomMarker());
//   }
//
//   Future<void> getMyLocation(BuildContext context) async {
//     try {
//       currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       LatLng myLatLng = LatLng(currentPosition!.latitude, currentPosition!.longitude);
//       List<Placemark> addressList = [];
//       addressList = await geocoding.placemarkFromCoordinates(currentPosition!.latitude, currentPosition!.longitude);
//
//       cameraPosition = CameraPosition(target: myLatLng, zoom: mapZoom);
//       mapController!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition!));
//       // String place =
//       // addressList.first.street!.isNotEmpty ? addressList.first.street! :
//       // addressList.first.subLocality!.isNotEmpty ?
//       // addressList.first.subLocality! : addressList.first.locality!;
//       mapMarker.add(Marker(markerId: const MarkerId('currentLocation'),
//           position: myLatLng,
//           icon: customMarker!));
//       emit(GetMyLocation());
//     } catch (e) {
//       if (kDebugMode) {
//         print('get my location error >>>>>>>>>> $e');
//       }
//     }
//   }
//
//   Future cameraMoving(double lat,double lng) =>
//       mapController!.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(
//             zoom: mapZoom,
//             target: LatLng(lat,lng),
//           ),
//         ),
//       );
//
//   void getLatLngOnMap(LatLng latLng){
//     mapMarker.clear();
//     mapMarker.add(Marker(markerId: const MarkerId('1'),
//         position:  LatLng(latLng.latitude, latLng.longitude),
//         icon: customMarker!));
//     // latLngOfAddress=LatLng(event.latLng.latitude, event.latLng.longitude);
//     // latitudeOfAddress=latLngOfAddress!.latitude;
//     // longitudeOfAddress=latLngOfAddress!.longitude;
//     // print('>M<<<<<<<<<<<<<<<<<<<<<$latLngOfAddress');
//     emit(GetLatLngState(latLng));
//
//   }
//   void getLocationDetailsByTapping(LatLng latLng) async {
//     List<geocoding.Placemark> addressList = [];
//     try{
//       addressList = await geocoding.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
//       zoneAddress = addressList.first.subAdministrativeArea!.isNotEmpty ? addressList.first.subAdministrativeArea :
//       (addressList.first.administrativeArea!.isNotEmpty ?
//       addressList.first.administrativeArea : addressList.first.locality) ;
//       print("$zoneAddress>>>>>>>>>>>>>>>>>>>44");
//       print("$addressList>>>>>>>>>>>>>>>>>>>44");
//     } catch (e) {
//       log('Error: $e');
//     }
//     emit(GetLocationDetailsByTappingMap(latLng));
//   }
//
//
//
//
//   // double mapZoom = 14;
//   // SearchData? searchData;
//   // Position? position;
//   // Position? currentPosition;
//   // CameraPosition? cameraPosition;
//   // BitmapDescriptor? customMarker;
//   // Uint8List? markerImage;
//   // final Completer<GoogleMapController> googleMapCompleter = Completer<GoogleMapController>();
//   // GoogleMapController? mapController ;
//   // var mapMarker = HashSet<Marker>();
//   //
//   // List<ServicesModel> servicesList = [
//   //   ServicesModel(title: 'مطاعم',image: SvgAssets.hamburger,index: 0),
//   //   ServicesModel(title: 'المتاجر العامة',image: SvgAssets.storeIcon,index: 1),
//   //   ServicesModel(title: 'طلب خاص',image: SvgAssets.openBox,index: 2),
//   // ];
//   //
//   // Marker marker = const Marker(
//   //   markerId: MarkerId('1'),
//   // );
//   // static const CameraPosition initialPosition = CameraPosition(
//   //   target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);
//
//
//
//   // getCustomMarker() async {
//   //   final Uint8List markerIcon = await getBytesFromAsset(ImageAssets.mapMarker, 80.w.toInt());
//   //   customMarker = BitmapDescriptor.fromBytes(markerIcon);
//   //   mapMarker.add(Marker(
//   //     markerId: const MarkerId('1'),
//   //     position: const LatLng(26.565191, 49.996376),
//   //     icon: customMarker!,
//   //   ));
//   //   emit(GetCustomMarker());
//   // }
//   //
//   // Future<Uint8List> getBytesFromAsset(String path, int width) async {
//   //   ByteData data = await rootBundle.load(path);
//   //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
//   //   ui.FrameInfo fi = await codec.getNextFrame();
//   //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
//   // }
//   //
//   //
//   // Future<void> getMyLocation(BuildContext context) async {
//   //   try {
//   //     currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   //     LatLng myLatLng = LatLng(currentPosition!.latitude, currentPosition!.longitude);
//   //      List<Placemark> addressList = [];
//   //      addressList = await geocoding.placemarkFromCoordinates(currentPosition!.latitude, currentPosition!.longitude);
//   //
//   //     cameraPosition = CameraPosition(target: myLatLng, zoom: mapZoom);
//   //     mapController!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition!));
//   //     // String place =
//   //     // addressList.first.street!.isNotEmpty ? addressList.first.street! :
//   //     // addressList.first.subLocality!.isNotEmpty ?
//   //     // addressList.first.subLocality! : addressList.first.locality!;
//   //     mapMarker.add(Marker(markerId: const MarkerId('currentLocation'),
//   //         position: myLatLng,
//   //         icon: customMarker!));
//   //     emit(GetMyLocation());
//   //   } catch (e) {
//   //     if (kDebugMode) {
//   //       print('get my location error >>>>>>>>>> $e');
//   //     }
//   //   }
//   // }
//   //
//   // void getLocationByTapping(LatLng latLng) async {
//   //   //List<Placemark> addressList = [];
//   //   try{
//   //     //addressList = await geocoding.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
//   //     await cameraMoving(latLng.latitude,latLng.longitude);
//   //     mapMarker.add(Marker(markerId: const MarkerId('currentLocation'),
//   //         position: latLng,
//   //         icon: customMarker!));
//   //
//   //     // String place =
//   //     // addressList.first.street!.isNotEmpty ? addressList.first.street! :
//   //     // addressList.first.subLocality!.isNotEmpty ?
//   //     // addressList.first.subLocality! : addressList.first.locality!;
//   //     emit(TappingMap(latLng.latitude));
//   //   } catch (e) {
//   //     if (kDebugMode) {
//   //       print('Error: TappingMap $e');
//   //     }
//   //   }
//   // }
//   //
//   // void goToSearchLocation(double lat,double lng){
//   //   cameraMoving(lat,lng);
//   //   mapMarker.add(Marker(markerId: const MarkerId('currentLocation'),
//   //       position: LatLng(lat,lng),
//   //       icon: customMarker!));
//   //   emit(GoToSearchLocation(lat));
//   // }
//   //
//   // Future cameraMoving(double lat,double lng) =>
//   //     mapController!.animateCamera(
//   //       CameraUpdate.newCameraPosition(
//   //         CameraPosition(
//   //           zoom: mapZoom,
//   //           target: LatLng(lat,lng),
//   //         ),
//   //       ),
//   //     );
//
//
//
//   // Marker customMarker(LatLng latLng) => Marker(
//   //       markerId: const MarkerId('1'),
//   //       position: latLng,
//   //       icon: customDestinationMarker ?? BitmapDescriptor.defaultMarkerWithHue(20),
//   //     );
//
//   // Future<SearchData?> getSearchData({String? value,BuildContext? context}) async{
//   //   try{
//   //     Map<String, dynamic> response= await instance<ApiService1>().getMapSearchData(
//   //         endPoint: Constants.mapSearchUrl,
//   //         parameters:{
//   //           "api_key":"5b3ce3597851110001cf6248ba446ffbbaf74d328bd2e5899a08358e",
//   //           "text":value,
//   //           "size":"50",
//   //           "boundary.country":"eg"
//   //         }
//   //     );
//   //     searchData = SearchData.fromJson(response);
//   //     emit(GetSearchData());
//   //   }catch(e){
//   //     if (kDebugMode) {
//   //       print("Search Error $e");
//   //     }
//   //   }
//   //   return searchData;
//   // }
//
//
//
// }