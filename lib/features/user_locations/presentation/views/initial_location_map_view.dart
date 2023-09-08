import 'package:flutter/material.dart';
import 'widgets/initial_location_map_view_body.dart';

class InitialLocationMapView extends StatelessWidget {
  const InitialLocationMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SelectedLocationOnMapViewBody(),
    );
  }
}






