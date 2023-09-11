import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/restaurant/presentation/manager/restaurant_cubit/restaurant_cubit.dart';
import '../core_cubit/map_cubit/map_cubit.dart';
import '../resources/routes_manager.dart';
import '../resources/theme_manager.dart';
import '../utils/location_permission.dart';
import '../utils/snackbar_message.dart';
import 'app_prefs.dart';
import 'di.dart';

class MyApp extends StatefulWidget {
  // named constructor
  MyApp._internal();

  int appState = 0;

  static final MyApp _instance = MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  @override
  void initState() {
    super.initState();
    openLocation();
  }

  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MapCubit>(create: (BuildContext context) => instance<MapCubit>()..getCustomMarker(),lazy: false,),
        BlocProvider<RestaurantCubit>(create: (BuildContext context) => instance<RestaurantCubit>()),
      ],

      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Father Delivery',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        routes: Routes().appRoutes(context),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        theme: getApplicationTheme(),
      ),
    );
  }
}
