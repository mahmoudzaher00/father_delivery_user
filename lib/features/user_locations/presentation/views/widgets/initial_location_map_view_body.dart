import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core_cubit/map_cubit/map_cubit.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_map_widget.dart';
import 'custom_set_location_and_service_button.dart';
import 'custom_map_search_widget.dart';

class SelectedLocationOnMapViewBody extends StatelessWidget {
  const SelectedLocationOnMapViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          return Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              CustomMapWidget(
                mapHeight: SizeConfig.screenHeight,
                getMyLocation: true,
                borderRadius: BorderRadius.zero,
              ),
              // const MapSearchWidget(),
              Padding(
                padding:const EdgeInsets.only(right:AppSize.s12,left:AppSize.s12,top:AppSize.s50,bottom:AppSize.s20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomMapSearchWidget(),
                    CustomSetLocationAndServiceButton(),
                  ],
                ),
              )
              // GoogleMap(
              //   initialCameraPosition: instance<MapCubit>().cameraPosition(),
              //   mapType: MapType.normal,
              //   onTap: (l) async {
              //     if (kDebugMode) {
              //       // print(l);
              //       print('dd.........');
              //     }
              //     // instance<MapBloc>().add(GetLatLngOnMapEvent(l));
              //     // instance<MapBloc>().add(GetLocationDetailsEvent(l));
              //   },
              //   onMapCreated: (GoogleMapController googleMapController) {
              //     // instance<MapBloc>().completer.complete(googleMapController);
              //     // _completer.complete(googleMapController);
              //     // instance<MapBloc>().mapController = googleMapController;
              //     // googleMapController.setMapStyle(MapManager.mapStyle);
              //     // instance<MapBloc>().add(GetMyLocationOnMspEvent());
              //   },
              //   onCameraMove: (c) {},
              //   markers: instance<MapCubit>().mapMarker,
              //   zoomControlsEnabled: false,
              //   // myLocationEnabled: true,
              //   zoomGesturesEnabled: true,
              //   scrollGesturesEnabled: true,
              //   compassEnabled: false,
              // ),
              // Padding(
              //   padding:const EdgeInsets.only(right:AppSize.s12,left:AppSize.s12,top:AppSize.s50,bottom:AppSize.s20),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       MapSearchWidget(),
              //       MapButton(),
              //     ],
              //   ),
              // )
            ],
          );
        }
    );
  }
}
