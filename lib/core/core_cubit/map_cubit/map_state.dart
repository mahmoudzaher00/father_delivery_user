part of'map_cubit.dart';

abstract class MapState  extends Equatable{
  const MapState();
  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {}

class GetCustomMarker extends MapState {}

class GetMyLocation extends MapState {
  @override
  List<Object> get props => [];
}

class GetLocationDetailsByTappingMap extends MapState {
  final LatLng latLng;
  const GetLocationDetailsByTappingMap(this.latLng);
  @override
  List<Object> get props => [latLng];
}

class GetLatLngState extends MapState {
  final LatLng latLng;
  const GetLatLngState(this.latLng);
  @override
  List<Object> get props => [latLng];
}

class GetSearchData extends MapState {}
class FetchSearchDataLoadingState extends MapState {}
class FetchSearchDataSuccessState extends MapState {
  final SearchDataModel searchData;
  const FetchSearchDataSuccessState(this.searchData);
  @override
  List<Object> get props => [searchData];
}
class FetchSearchDataFailureState extends MapState {
  final String errorMessage;
  const FetchSearchDataFailureState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class GoToSearchLocation extends MapState {
  final double lat;
  final double lng;

  const GoToSearchLocation(this.lat,this.lng);
  @override
  List<Object> get props => [lat,lng];
}


class UpdateTextFieldStatus extends MapState {
  final bool hasFocus;

  const UpdateTextFieldStatus(this.hasFocus);
  @override
  List<Object> get props => [hasFocus];
}

class FetchImageMarker extends MapState {

}


class AddRestaurantAndUserMarker extends MapState {
  final double lat;
  final double lng;

  const AddRestaurantAndUserMarker(this.lat,this.lng);
  @override
  List<Object> get props => [lat,lng];
}