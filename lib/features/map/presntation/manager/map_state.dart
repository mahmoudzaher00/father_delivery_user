import 'package:equatable/equatable.dart';

abstract class MapState  extends Equatable{
  const MapState();
  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {
}

class GetMyLocation extends MapState {
  @override
  List<Object> get props => [];
}

class TappingMap extends MapState {
  final double lat;

  const TappingMap(this.lat);
  @override
  List<Object> get props => [lat];
}

class GetSearchData extends MapState {
}

class GoToSearchLocation extends MapState {
  final double lat;

  const GoToSearchLocation(this.lat);
  @override
  List<Object> get props => [lat];
}