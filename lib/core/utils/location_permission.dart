import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


Future<PermissionStatus> requestPermission() async {
  return await Permission.locationWhenInUse.request();
}


void openLocation() async{
  PermissionStatus status =await requestPermission();
  if (status == PermissionStatus.granted) {
    if (kDebugMode) {
      print('Permission granted');
    }
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  } else if (status == PermissionStatus.denied) {
    if (kDebugMode) {
      print('Denied. Show a dialog with a reason and again ask for the permission.');
    }
    await requestPermission();
  }

}