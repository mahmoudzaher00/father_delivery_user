import 'package:father_delivery_user/features/auth/presentation/views/login_view.dart';
import 'package:father_delivery_user/features/auth/presentation/views/otp_view.dart';
import 'package:father_delivery_user/features/auth/presentation/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../features/home/presentation/views/HomeScreen.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/user_locations/presentation/views/initial_location_map_view.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String mapRoute = "/map";
  static const String homeRoute = "/home";
  static const String registerRoute = "/register";
  static const String otpRoute = "/otp";
  static const String addPhoneOrEmailRoute = "/AddMobileOrEmailView";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String newPasswordRoute = "/newPasswordViewBody";
  static const String mainRoute = "/main";
  static const String selectedCategoryRoute = "/selectedCategory";
  static const String categoryProductRoute = "/CategoryProduct";
  static const String filtersRoute = "/filters";
  static const String storeFilterRoute = "/storeFilter";
  static const String storeProductsRoute = "/storeProducts";
  static const String ratingProductsRoute = "/ratingProducts";
  static const String storeProfileRoute = "/storeProfile";
  static const String addressRoute = "/address";
  static const String editAddressRoute = "/editAddress";
  static const String wishListRoute = "/wishList";
  static const String ordersRoute = "/orders";
  static const String selectedOrderDetailsRoute = "/selectedOrderDetails";
  static const String checkOutRoute = "/checkOut";
  static const String addNewAddressRoute = "/addNewAddress";
  static const String searchRoute = "/Search";
  static const String profileRoute = "/Profile";
  static const String editEmailRoute = "/editEmail";
  static const String editPasswordRoute = "/editPassword";
  static const String notificationRoute = "/notification";
  static const String changePasswordRoute = "/changePassword";
  static const String ratingServicesRoute = "/ratingServices";
  static const String editRatingServicesRoute = "/editRatingServices";
  static const String allRatingRoute = "/allRating";
  static const String userAddressesRoute = "/userAddresses";
  static const String paymentCardsRoute = "/paymentCards";
  static const String addNewPaymentCardsRoute = "/addNewPaymentCards";
  static const String paymentRoute = "/payment";
  static const String finalBillRoute = "/finalBill";
  static const String customMapToSetAddressRoute = "/customMapToSetAddress";
  static const String setAddressFromMapRoute = "/setAddressFromMap";
  static const String cameraMaintenanceServiceRoute = "/CameraMaintenanceService";
  static const String plumbingServiceRoute = "/plumbingService";
  static const String electricityServiceRoute = "/electricityService";
  static const String locationsRoute = "/locations";
  static const String termsAndConditionsRoute = "/termsAndConditions";
  static const String contactUsRoute = "/contactUs";
  static const String aboutRoute = "/about";
  static const String privacyPolicyRoute = "/privacyPolicy";

  appRoutes(context) {
    return {
      Routes.splashRoute: (context) => const SplashView(),
      Routes.mapRoute: (context) =>  const InitialLocationMapView(),
      Routes.loginRoute: (context) => const LoginView(),
      Routes.homeRoute: (context) => const HomeView(),
      Routes.registerRoute: (context) => const RegisterView(),
      Routes.otpRoute: (context) => const OtpView(),

    };
  }
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.mapRoute:return MaterialPageRoute(builder: (_) => const InitialLocationMapView());
      case Routes.loginRoute:return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.homeRoute:return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.registerRoute:return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.otpRoute:return MaterialPageRoute(builder: (_) => const OtpView());

      default:return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound.tr()),
              ),
              body: Center(child: Text(AppStrings.noRouteFound.tr())),
            ));
  }
}
