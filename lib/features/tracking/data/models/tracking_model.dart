import 'package:google_maps_flutter/google_maps_flutter.dart';

class DrawLineDataModel{
  List<LatLng> listOfPoints = [];
  DrawLineDataModel.froJson(Map<String ,dynamic> json){
    final list = json["features"][0]["geometry"]["coordinates"] as List;

    for (var element in list) {
      listOfPoints.add(LatLng(element[1],element[0]));
    }

  }
}