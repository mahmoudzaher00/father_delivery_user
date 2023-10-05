import 'package:father_delivery_user/core/core_cubit/map_cubit/map_cubit.dart';
import 'package:father_delivery_user/core/resources/color_manager.dart';
import 'package:father_delivery_user/features/tracking/presentation/manager/tracking_map_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/app/constants.dart';
import '../../../../core/app/di.dart';
import '../../../../core/utils/api_service_1.dart';
import '../../data/models/tracking_model.dart';


class TrackingMapCubit extends Cubit<TrackingMapState> {
  TrackingMapCubit() : super(TrackingMapInitial());
  static TrackingMapCubit get(context)=>BlocProvider.of(context);
  Set<Polyline> polyLines = {};
  Set<Marker> markers = {};
  DrawLineDataModel? drawLineDataModel;


  Marker customMarker({required LatLng latLng,String? markerId,BitmapDescriptor? marker}) => Marker(
    markerId: MarkerId(markerId??'location'),
    position: latLng,
    icon:marker?? BitmapDescriptor.defaultMarkerWithHue(20),
  );

  Future<DrawLineDataModel?> getPolyLineData({double? startPointLat,double? startPointLng,double? endPointLat,double? endPointLng}) async{
    emit(GetPolyLineDataLoading());
    try{
      Map<String, dynamic> response = await instance<ApiService1>().getMapSearchData(
          endPoint: Constants.mapPolyLinesUrl,
          parameters:{
            "api_key":"5b3ce3597851110001cf6248ba446ffbbaf74d328bd2e5899a08358e",
            "start":'$startPointLng,$startPointLat',
            "end":'$endPointLng,$endPointLat',
          }
      );
      drawLineDataModel = DrawLineDataModel.froJson(response);
      markers.add(customMarker(latLng: LatLng(startPointLat!, startPointLng!),markerId: 'Restaurant',marker:  instance<MapCubit>().restaurantMarker ));
      markers.add(customMarker(latLng: LatLng(endPointLat!, endPointLng!),markerId: 'User',marker:  instance<MapCubit>().secUserMarker ));
      markers.add(customMarker(latLng: const LatLng(31.45432557661457, 31.690951831643343),markerId: 'driver',marker:  instance<MapCubit>().driverMarker ));
      polyLines.add(
          Polyline(
              color: ColorManager.lightOrange,
              width: 3,
              polylineId: const PolylineId("direction"),
              points: drawLineDataModel!.listOfPoints),
      );

      emit(GetPolyLineDataSuccess());

    }catch(e){
      emit(GetPolyLineDataError());
      if (kDebugMode) {
        print("Search Error $e");
      }
    }
    return drawLineDataModel;
  }

}