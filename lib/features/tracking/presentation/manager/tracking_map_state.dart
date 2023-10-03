import 'package:equatable/equatable.dart';

abstract class TrackingMapState  /*extends Equatable*/{
  const TrackingMapState();
  // @override
  // List<Object> get props => [];
}

class TrackingMapInitial extends TrackingMapState {}
class GetPolyLineDataLoading extends TrackingMapState {}
class GetPolyLineDataError extends TrackingMapState {}
class GetPolyLineDataSuccess extends TrackingMapState {}


