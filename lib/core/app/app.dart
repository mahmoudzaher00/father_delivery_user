import 'package:easy_localization/easy_localization.dart';
import 'package:father_delivery_user/core/core_cubit/audio_cubit/audio_record_cubit.dart';
import 'package:father_delivery_user/core/utils/location_permission.dart';
import 'package:father_delivery_user/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/my_orders/presentation/manager/my_orders_cubit/my_orders_cubit.dart';
import '../../features/restaurant/presentation/manager/ingredients_bottom_sheet_cubit/ingredients_bottom_sheet_cubit.dart';
import '../../features/cart/presentation/manager/cart_cubit.dart';
import '../../features/restaurant/presentation/manager/restaurant_cubit/restaurant_cubit.dart';
import '../../features/restaurant/presentation/manager/tt/counter_cubit.dart';
import '../../features/store/presentation/manager/store_cubit/store_cubit.dart';
import '../../features/store/presentation/manager/store_products_cubit/store_products_cubit.dart';
import '../core_cubit/map_cubit/map_cubit.dart';
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
        BlocProvider<MapCubit>(create: (BuildContext context) => instance<MapCubit>()..getCustomMarker(),lazy: false,),
        BlocProvider<HomeCubit>(create: (BuildContext context) => HomeCubit()),
        BlocProvider<CartCubit>(create: (BuildContext context) => CartCubit()),
        BlocProvider<StoreCubit>(create: (BuildContext context) => StoreCubit()),
        BlocProvider<MyOrdersCubit>(create: (BuildContext context) => MyOrdersCubit()),
        BlocProvider<StoreProductsCubit>(create: (BuildContext context) => StoreProductsCubit()),
        BlocProvider<RestaurantCubit>(create: (BuildContext context) => instance<RestaurantCubit>()),
        BlocProvider<CounterCubit>(create: (BuildContext context) => CounterCubit()),
        BlocProvider<IngredientsBottomSheetCubit>(create: (BuildContext context) => instance<IngredientsBottomSheetCubit>(),),
        BlocProvider<AudioCubit>(create: (BuildContext context) => instance<AudioCubit>(),),
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
