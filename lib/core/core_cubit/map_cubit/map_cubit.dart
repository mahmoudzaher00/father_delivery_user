import 'dart:async';
import 'dart:collection';
import 'dart:developer';
import 'dart:ui' as ui;
import 'package:equatable/equatable.dart';
import 'package:father_delivery_user/core/resources/assets_manager.dart';
import 'package:father_delivery_user/features/user_locations/data/models/search_data_model.dart';
import 'package:father_delivery_user/features/user_locations/data/repository/user_locations_repo.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;


part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final UserLocationRepo userLocationRepo;

  MapCubit(this.userLocationRepo) : super(MapInitial());

  //TODO:Map Inputs
  var emptyMarker = HashSet<Marker>();
  final Completer<GoogleMapController> googleMapCompleter = Completer<GoogleMapController>();
  BitmapDescriptor? customDestinationMarker;
  Position? currentPosition;
  CameraPosition? cameraPosition;
  double mapZoom = 14;
  GoogleMapController? mapController;
  String? zoneAddress;
  SearchDataModel? searchData;
  Marker marker = const Marker(markerId: MarkerId('location'),);

  //TODO:Ui functions
  Marker customMarker(LatLng latLng) => Marker(
    markerId: const MarkerId('location'),
    position: latLng,
    icon: customDestinationMarker ?? BitmapDescriptor.defaultMarkerWithHue(20),
  );
  CameraPosition initialPosition() => const CameraPosition(target: LatLng(26.565191, 49.996376), zoom: 14);

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  getCustomMarker() async {
    final Uint8List markerIcon = await getBytesFromAsset(ImageAssets.mapMarker, 80.w.toInt());
    customDestinationMarker = BitmapDescriptor.fromBytes(markerIcon);
    marker = Marker(
      markerId: const MarkerId('location'),
      position: const LatLng(26.565191, 49.996376),
      icon: customDestinationMarker!,
    );
    emit(GetCustomMarker());
  }

  Future<void> getMyLocation(BuildContext context) async {
    try {
      currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      LatLng myLatLng = LatLng(currentPosition!.latitude, currentPosition!.longitude);
      List<Placemark> addressList = [];
      addressList = await geocoding.placemarkFromCoordinates(currentPosition!.latitude, currentPosition!.longitude);
      cameraPosition = CameraPosition(target: myLatLng, zoom: mapZoom);
      mapController!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition!));
      marker = customMarker(myLatLng);
      emit(GetMyLocation());
    } catch (e) {
      if (kDebugMode) {
        print('get my location error >>>>>>>>>> $e');
      }
    }
  }

  Future cameraMoving(double lat, double lng) => mapController!.animateCamera(
    CameraUpdate.newCameraPosition(
      CameraPosition(
        zoom: mapZoom,
        target: LatLng(lat, lng),
      ),
    ),
  );

  void getLatLngOnMap(LatLng latLng) {
    marker = customMarker(latLng);
    emit(GetLatLngState(latLng));
  }

  void getLocationDetailsByTapping(LatLng latLng) async {
    List<geocoding.Placemark> addressList = [];
    try {
      addressList = await geocoding.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      zoneAddress = addressList.first.subAdministrativeArea!.isNotEmpty ?
      addressList.first.subAdministrativeArea : (addressList.first.administrativeArea!.isNotEmpty ?
      addressList.first.administrativeArea : addressList.first.locality);
      marker = customMarker(latLng);
    } catch (e) {
      log('Error: $e');
    }
    emit(GetLocationDetailsByTappingMap(latLng));
  }

  void goToSearchLocation(double lat, double lng) {
    cameraMoving(lat, lng);
    marker = customMarker(LatLng(lat, lng));
    emit(GoToSearchLocation(lat, lng));
  }

  //TODO:Apis functions
  Future<void> fetchSearchData(value,) async {
    emit(FetchSearchDataLoadingState());
    var result = await userLocationRepo.fetchSearchData(value);
    result.fold((failure) {
      emit(FetchSearchDataFailureState(failure.errMessage));
    }, (dataModel) {
      searchData = dataModel;
      emit(FetchSearchDataSuccessState(dataModel));
    });
  }
}
