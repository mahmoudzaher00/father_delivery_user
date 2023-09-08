import 'package:easy_localization/easy_localization.dart';
import 'package:father_delivery_user/core/utils/location_permission.dart';
import 'package:father_delivery_user/features/splash/presentation/manager/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/map/presntation/manager/map_cubit.dart';
import '../resources/routes_manager.dart';
import '../resources/theme_manager.dart';
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
        BlocProvider<MapCubit>(create: (BuildContext context) => MapCubit()),
        BlocProvider<SplashCubit>(create: (BuildContext context) => SplashCubit()),
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
