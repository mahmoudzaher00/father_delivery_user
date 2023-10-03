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
import 'package:http/http.dart' as http;

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

import '../../app/app_prefs.dart';
import '../../app/di.dart';


part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final UserLocationRepo userLocationRepo;

  MapCubit(this.userLocationRepo) : super(MapInitial());
  static MapCubit get(context)=>BlocProvider.of(context);
  //TODO:Map Inputs
  LatLng? savedLocation;
  var emptyMarker = HashSet<Marker>();
  Completer<GoogleMapController>? googleMapCompleter;
  FocusNode textFieldFocusNode = FocusNode();
  BitmapDescriptor? userMarker;
  BitmapDescriptor? restaurantMarker;
  BitmapDescriptor? defaultMarker;
  BitmapDescriptor? secUserMarker;
  BitmapDescriptor? driverMarker;
  Position? currentPosition;
  CameraPosition? cameraPosition;
  double mapZoom = 14;
  GoogleMapController? mapController;
  String? zoneAddress;
  SearchDataModel? searchData;
  bool searchLoader = false ;
  Marker marker = const Marker(markerId: MarkerId('location'));

  //TODO:Ui functions

  void convertNetworkImageToMapMarker() async{
    String iconUrl ="https://w7.pngwing.com/pngs/753/264/png-transparent-map-marker-icon-google-map-maker-google-maps-map-marker-blue-angle-triangle-thumbnail.png";
    Uint8List dataBytes;
    var request = await http.get(Uri.parse(iconUrl));
    Uint8List bytes = request.bodyBytes;
    dataBytes = bytes;
    emit(FetchImageMarker());

    LatLng restaurantLocation = const LatLng(31.44377763284619, 31.691754944622517);
    emptyMarker.add(
        Marker(
         // icon: BitmapDescriptor.fromBytes(dataBytes.buffer.asUint8List(),size: const Size(20,20)),
          icon: BitmapDescriptor.defaultMarkerWithHue(20),
          markerId: const MarkerId('RestaurantLocation'),
          position: restaurantLocation,
        )
    );
    getUserLocationFromCache();
    emit(AddRestaurantAndUserMarker(restaurantLocation.latitude,restaurantLocation.longitude));
    cameraMoving(restaurantLocation.latitude, restaurantLocation.longitude);

  }

  void getUserLocationFromCache(){
    emptyMarker.add(
        Marker(
          markerId: const MarkerId('UserLocation'),
          position: const LatLng(31.45295797598678,31.69081181287766),
          icon: BitmapDescriptor.defaultMarkerWithHue(90),
        )
    );
  }

  void updateTextFieldStatus(){
    emit(UpdateTextFieldStatus(textFieldFocusNode.hasFocus));
  }

  Marker customMarker(LatLng latLng) => Marker(
    markerId: const MarkerId('location'),
    position: latLng,
    icon: userMarker ?? BitmapDescriptor.defaultMarkerWithHue(20),
  );
  CameraPosition initialPosition() => CameraPosition(
      target: instance<AppPreferences>().getDataFromSharedPreference(key:'lat') != null?
      LatLng(instance<AppPreferences>().getDataFromSharedPreference(key:'lat').toDouble(),
             instance<AppPreferences>().getDataFromSharedPreference(key:'lng').toDouble()):
      const LatLng(26.565191, 49.996376),
      zoom: 14);

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  getCustomMarker() async {
    final Uint8List markerIcon = await getBytesFromAsset(ImageAssets.mapMarker, 80.w.toInt());
    final Uint8List restaurantMarkerIcon = await getBytesFromAsset(ImageAssets.restaurantMarker, 80);
    final Uint8List defaultMarkerIcon = await getBytesFromAsset(ImageAssets.defaultMarker, 60);
    final Uint8List userMarkerIcon = await getBytesFromAsset(ImageAssets.userMarker, 80);
    final Uint8List driverMarkerIcon = await getBytesFromAsset(ImageAssets.driverMarker, 80);
    userMarker = BitmapDescriptor.fromBytes(markerIcon);
    restaurantMarker = BitmapDescriptor.fromBytes(restaurantMarkerIcon);
    defaultMarker = BitmapDescriptor.fromBytes(defaultMarkerIcon);
    secUserMarker = BitmapDescriptor.fromBytes(userMarkerIcon);
    driverMarker = BitmapDescriptor.fromBytes(driverMarkerIcon);
    marker = Marker(
      markerId: const MarkerId('location'),
      position: instance<AppPreferences>().getDataFromSharedPreference(key:'lat') != null?
      LatLng(instance<AppPreferences>().getDataFromSharedPreference(key:'lat').toDouble(),
          instance<AppPreferences>().getDataFromSharedPreference(key:'lng').toDouble()):
      const LatLng(26.565191, 49.996376),
      icon: userMarker!,
    );
    emit(GetCustomMarker());
  }

  Future<void> getMyLocation(BuildContext context) async {
    try {
      currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      LatLng myLatLng = LatLng(currentPosition!.latitude, currentPosition!.longitude);
      savedLocation = myLatLng;
      List<Placemark> addressList = [];
      addressList = await geocoding.placemarkFromCoordinates(currentPosition!.latitude, currentPosition!.longitude);
      zoneAddress =  addressList.first.street!.isNotEmpty ?
      addressList.first.street:
      addressList.first.subAdministrativeArea!.isNotEmpty ?
      addressList.first.subAdministrativeArea : (addressList.first.administrativeArea!.isNotEmpty ?
      addressList.first.administrativeArea : addressList.first.locality);
      instance<AppPreferences>().putDataInSharedPreference(value: zoneAddress , key: 'zoneAddress');
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
      savedLocation = latLng;
      addressList = await geocoding.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      zoneAddress = addressList.first.street!.isNotEmpty ?
      addressList.first.street:
      addressList.first.subAdministrativeArea!.isNotEmpty ?
      addressList.first.subAdministrativeArea : (addressList.first.administrativeArea!.isNotEmpty ?
      addressList.first.administrativeArea : addressList.first.locality);
      instance<AppPreferences>().putDataInSharedPreference(value: zoneAddress , key: 'zoneAddress');
      cameraMoving(latLng.latitude, latLng.longitude);
      marker = customMarker(latLng);
    } catch (e) {
      log('Error: $e');
    }
    emit(GetLocationDetailsByTappingMap(latLng));
  }

  void goToSearchLocation(double lat, double lng) async{
    List<geocoding.Placemark> addressList = [];
    addressList = await geocoding.placemarkFromCoordinates(lat, lng);
    zoneAddress = addressList.first.street!.isNotEmpty ?
    addressList.first.street:
    addressList.first.subAdministrativeArea!.isNotEmpty ?
    addressList.first.subAdministrativeArea : (addressList.first.administrativeArea!.isNotEmpty ?
    addressList.first.administrativeArea : addressList.first.locality);
    instance<AppPreferences>().putDataInSharedPreference(value: zoneAddress , key: 'zoneAddress');
    cameraMoving(lat, lng);
    marker = customMarker(LatLng(lat, lng));
    emit(GoToSearchLocation(lat, lng));
  }

  //TODO:Apis functions
  Future<void> fetchSearchData(value) async {
    searchLoader = true ;
    emit(FetchSearchDataLoadingState());
    var result = await userLocationRepo.fetchSearchData(value);
    result.fold((failure) {
      searchLoader = false ;
      emit(FetchSearchDataFailureState(failure.errMessage));
    }, (dataModel) {
      searchLoader = false ;
      searchData = dataModel;
      emit(FetchSearchDataSuccessState(dataModel));
    });
  }
}
