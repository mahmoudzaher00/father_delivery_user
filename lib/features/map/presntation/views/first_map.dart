import 'package:father_delivery_user/core/resources/values_manager.dart';
import 'package:father_delivery_user/features/map/presntation/manager/map_state.dart';
import 'package:father_delivery_user/features/map/presntation/views/widgets/map_button.dart';
import 'package:father_delivery_user/features/map/presntation/views/widgets/map_search_widget.dart';
import 'package:father_delivery_user/features/map/presntation/views/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/map_cubit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
    MapCubit.get(context).markerImage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          final controller = MapCubit.get(context);
          return Stack(
              alignment: Alignment.center,
              children: [
                GoogleMapWidget(controller: controller),
                Padding(
                  padding:const EdgeInsets.only(right:AppSize.s12,left:AppSize.s12,top:AppSize.s50,bottom:AppSize.s20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MapSearchWidget(controller: controller),
                      MapButton(controller: controller),
                    ],
                  ),
                )
             ],
          );
        }
      ),
    );
  }
}






