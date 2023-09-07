import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app/app.dart';
import 'core/app/di.dart';
import 'core/resources/language_manager.dart';
import 'core/utils/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await initAppModule();
  // Constants.systemUiOverlayStyle;
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],

      );
  runApp(
    // MultiBlocProvider(
    //   providers: [
    //     // BlocProvider(create: (BuildContext context) => LanguageCubit(),),
    //   ],
      // child: BlocBuilder<LanguageCubit, LanguageState>(
      //     builder: (context, state) {
      //       return EasyLocalization(
      //         startLocale: ARABIC_LOCAL,
      //         saveLocale: true,
      //         supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      //         path: ASSET_PATH_LOCALISATIONS,
      //         child: ScreenUtilInit(
      //           designSize: const Size(375, 812),
      //           builder: (context, child) => child!,
      //           child: MyApp(),
      //         ),
      //
      //       );
      //     }),
       EasyLocalization(
        startLocale: ARABIC_LOCAL,
        saveLocale: true,
        supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
        path: ASSET_PATH_LOCALISATIONS,
        child: ScreenUtilInit(
          designSize: const Size(428, 926),
          builder: (context, child) => child!,
          child: MyApp(),
        ),
      ));
}
