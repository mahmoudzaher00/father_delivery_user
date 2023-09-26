import 'package:dio/dio.dart';
import 'package:father_delivery_user/core/core_cubit/audio_cubit/audio_record_cubit.dart';
import 'package:father_delivery_user/features/orders/presentation/manager/new_order_cubit/new_order_cubit.dart';
import 'package:father_delivery_user/features/user_locations/data/repository/user_locations_repo_impl.dart';
import 'package:father_delivery_user/features/user_locations/presentation/views/user_locations_input_data.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/manager/registerDataCubit/register_data_cubit.dart';
import '../../features/auth/presentation/manager/register_cubit/register_cubit.dart';
import '../../features/auth/presentation/views/auth_input_data.dart';
import '../../features/cart/presentation/manager/cart_cubit.dart';
import '../../features/home/presentation/manager/home_cubit/home_cubit.dart';
import '../../features/orders/presentation/views/orders_input_data.dart';
import '../../features/restaurant/presentation/manager/ingredients_bottom_sheet_cubit/ingredients_bottom_sheet_cubit.dart';
import '../../features/restaurant/presentation/manager/restaurant_cubit/restaurant_cubit.dart';
import '../core_cubit/map_cubit/map_cubit.dart';
import '../utils/api_service_1.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);


  // app prefs instance

  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  //TODO:Generics instance
  instance.registerLazySingleton<AuthInputData>(() => AuthInputData());
  instance.registerLazySingleton<UserLocationsInputData>(() => UserLocationsInputData());
  instance.registerLazySingleton<OrdersInputData>(() => OrdersInputData());

  //TODO:Cubit instance
   instance.registerLazySingleton<MapCubit>(() => MapCubit(instance.get<UserLocationsRepoImpl>()));
   //instance.registerFactory<MapCubit>(() => MapCubit(instance.get<UserLocationsRepoImpl>()));
   instance.registerLazySingleton<HomeCubit>(() => HomeCubit());
   instance.registerLazySingleton<CartCubit>(() => CartCubit());
  // instance.registerLazySingleton<LoginBloc>(() => LoginBloc(instance.get<AuthRepoImpl>()));
  instance.registerLazySingleton<LoginCubit>(() => LoginCubit());
  instance.registerLazySingleton<RegisterCubit>(() => RegisterCubit());
  instance.registerLazySingleton<RegisterDataCubit>(() => RegisterDataCubit());
  instance.registerLazySingleton<RestaurantCubit>(() => RestaurantCubit());
  instance.registerLazySingleton<IngredientsBottomSheetCubit>(() => IngredientsBottomSheetCubit());
  instance.registerLazySingleton<AudioCubit>(() => AudioCubit());
  instance.registerLazySingleton<NewOrderCubit>(() => NewOrderCubit());
  // instance.registerLazySingleton<RegisterBloc>(() => RegisterBloc(instance.get<AuthRepoImpl>()));
  // instance.registerLazySingleton<OtpBloc>(() => OtpBloc(instance.get<AuthRepoImpl>()));
  // instance.registerLazySingleton<MainBloc>(() => MainBloc());
  // instance.registerLazySingleton<HomeBloc>(() => HomeBloc(instance.get<MainRepoImpl>()));
  // instance.registerLazySingleton<CategoriesBloc>(() => CategoriesBloc(instance.get<MainRepoImpl>()));
  // instance.registerLazySingleton<StoreProductBloc>(() => StoreProductBloc());
  // instance.registerLazySingleton<AccountBloc>(() => AccountBloc());
  // instance.registerLazySingleton<CartBloc>(() => CartBloc());
  // instance.registerLazySingleton<MapBloc>(() => MapBloc(instance.get<MapRepoImpl>()));
  // instance.registerLazySingleton<OrdersBloc>(() => OrdersBloc());
  // instance.registerLazySingleton<CheckOutBloc>(() => CheckOutBloc());
  // instance.registerLazySingleton<AddressBloc>(() => AddressBloc(instance.get<UserAddressRepoImpl>()));
  // instance.registerLazySingleton<AddNewAddressBloc>(() => AddNewAddressBloc(instance.get<UserAddressRepoImpl>()));
  // instance.registerLazySingleton<EditAddressBloc>(() => EditAddressBloc(instance.get<UserAddressRepoImpl>()));
  // instance.registerLazySingleton<ProfileBloc>(() => ProfileBloc(instance.get<MainRepoImpl>()));
  // instance.registerLazySingleton<ChangeLanguageBloc>(() => ChangeLanguageBloc());
  // instance.registerLazySingleton<TextFieldCubit>(() => TextFieldCubit());
  // instance.registerLazySingleton<RegisterCubit>(() => RegisterCubit());
  // instance.registerLazySingleton<NewPasswordCubit>(() => NewPasswordCubit());
  // instance.registerLazySingleton<MainCubit>(() => MainCubit());

  // instance.registerLazySingleton<NotificationCubit>(() => NotificationCubit());
  // instance.registerLazySingleton<ProfileCubit>(() => ProfileCubit(instance.get<MainRepoImpl>()));
  // instance.registerLazySingleton<EditProfileCubit>(() => EditProfileCubit());
  // instance.registerLazySingleton<RatingServiceCubit>(() => RatingServiceCubit());
  // instance.registerLazySingleton<UserAddressesCubit>(() => UserAddressesCubit());
  // instance.registerLazySingleton<OrdersCubit>(() => OrdersCubit());
  // instance.registerLazySingleton<SettingCubit>(() => SettingCubit());
  // instance.registerLazySingleton<PaymentCubit>(() => PaymentCubit());
  // instance.registerLazySingleton<MapCubit>(() => MapCubit());
  // instance.registerLazySingleton<PaymentCardsCubit>(() => PaymentCardsCubit());
  // instance.registerLazySingleton<CameraMaintenanceCubit>(() => CameraMaintenanceCubit());
  // instance.registerLazySingleton<PlumbingServiceCubit>(() => PlumbingServiceCubit());
  // instance.registerLazySingleton<ElectricityServiceCubit>(() => ElectricityServiceCubit());
  // instance.registerLazySingleton<ContactUsCubit>(() => ContactUsCubit());
  // instance.registerLazySingleton<ChangePasswordCubit>(() => ChangePasswordCubit());
  // instance.registerSingleton<CacheHelper>(CacheHelper());

  // network info
  // instance.registerLazySingleton<NetworkInfo>(
  //     () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerSingleton<ApiService1>(ApiService1(Dio()));


  // instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  // Dio dio = await instance<DioFactory>().getDio();

  //app service client
  // instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));


  // repository
  instance.registerSingleton<UserLocationsRepoImpl>(UserLocationsRepoImpl(instance.get<ApiService1>()));
  // instance.registerSingleton<UserAddressRepoImpl>(UserAddressRepoImpl(instance.get<ApiService>()));
  // instance.registerSingleton<MapRepoImpl>(MapRepoImpl(instance.get<ApiService1>()));
  // instance.registerSingleton<MainRepoImpl>(MainRepoImpl(instance.get<ApiService>(),instance.get<ApiService1>()));

  // instance.registerLazySingleton<Repository>(
  //     () => RepositoryImpl(instance(), instance(), instance()));
}

// initLoginModule() {
//   if (!GetIt.I.isRegistered<LoginUseCase>()) {
//     instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
//     instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
//   }
// }
//
// initForgotPasswordModule() {
//   if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
//     instance.registerFactory<ForgotPasswordUseCase>(
//         () => ForgotPasswordUseCase(instance()));
//     instance.registerFactory<ForgotPasswordViewModel>(
//         () => ForgotPasswordViewModel(instance()));
//   }
// }

// initRegisterModule() {
//   if (!GetIt.I.isRegistered<RegisterUseCase>()) {
//     instance
//         .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
//     instance.registerFactory<RegisterViewModel>(
//         () => RegisterViewModel(instance()));
//     instance.registerFactory<ImagePicker>(() => ImagePicker());
//   }
// }

// initHomeModule() {
//   if (!GetIt.I.isRegistered<HomeUseCase>()) {
//     instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
//     instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
//   }
// }

// initStoreDetailsModule() {
//   if (!GetIt.I.isRegistered<StoreDetailsUseCase>()) {
//     instance.registerFactory<StoreDetailsUseCase>(
//         () => StoreDetailsUseCase(instance()));
//     instance.registerFactory<StoreDetailsViewModel>(
//         () => StoreDetailsViewModel(instance()));
//   }
// }
