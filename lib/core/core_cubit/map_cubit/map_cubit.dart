import 'dart:async';
import 'dart:ui' as ui;
import 'dart:collection';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../resources/assets_manager.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());
  var mapMarker = HashSet<Marker>();
  var emptyMarker = HashSet<Marker>();
  final Completer<GoogleMapController> completer = Completer();
  BitmapDescriptor? customMarker;
  Uint8List? markerImage;

  CameraPosition cameraPosition() =>
      const CameraPosition(target: LatLng(26.565191, 49.996376), zoom: 14);

  getCustomMarker() async {
    final Uint8List markerIcon = await getBytesFromAsset(ImageAssets.mapMarker, 80.w.toInt());
    customMarker = BitmapDescriptor.fromBytes(markerIcon);
    mapMarker.add(Marker(
      markerId: const MarkerId('1'),
      position: const LatLng(26.565191, 49.996376),
      icon: customMarker!,
    ));
    emit(GetCustomMarker());
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
}
