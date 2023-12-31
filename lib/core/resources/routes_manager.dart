import 'package:father_delivery_user/features/auth/presentation/views/active_account_view.dart';
import 'package:father_delivery_user/features/auth/presentation/views/login_view.dart';
import 'package:father_delivery_user/features/auth/presentation/views/otp_view.dart';
import 'package:father_delivery_user/features/auth/presentation/views/register_view.dart';
import 'package:father_delivery_user/features/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:father_delivery_user/features/favourite/presentation/views/favourite_view.dart';
import 'package:father_delivery_user/features/home/presentation/views/home_view.dart';
import 'package:father_delivery_user/features/notification/presentation/views/notification_view.dart';
import 'package:father_delivery_user/features/restaurant/presentation/views/restaurant_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../features/auth/presentation/views/register_data_view.dart';
import '../../features/cart/presentation/views/cart_view.dart';
import '../../features/delivery_pricing/presentation/views/delivery_pricing_details_view.dart';
import '../../features/delivery_pricing/presentation/views/delivery_pricing_view.dart';
import '../../features/invoices/presentation/views/order_invoice_details_view.dart';
import '../../features/invoices/presentation/views/order_invoices_view.dart';
import '../../features/my_orders/presentation/views/my_orders_view.dart';
import '../../features/orders/presentation/views/new_order_view.dart';
import '../../features/orders/presentation/views/order_details_view.dart';
import '../../features/orders/presentation/views/orders_view.dart';
import '../../features/orders/presentation/views/track_order_view.dart';
import '../../features/play_audio/play_audio_view.dart';
import '../../features/restaurant/presentation/views/offer_meal_view.dart';
import '../../features/restaurant/presentation/views/restaurant_map_view.dart';
import '../../features/restaurant/presentation/views/meal_ingredients_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/store/presentation/views/store_products_view.dart';
import '../../features/store/presentation/views/store_view.dart';
import '../../features/terms_contact/presentation/view/contact_us_view.dart';
import '../../features/terms_contact/presentation/view/terms_view.dart';
import '../../features/tracking/presentation/view/tracking_driver_view.dart';
import '../../features/user_locations/presentation/views/confirm_user_location_view.dart';
import '../../features/user_locations/presentation/views/initial_location_map_view.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String initialLocationMapRoute = "/initialLocationMap";
  static const String homeRoute = "/home";
  static const String registerRoute = "/register";
  static const String otpRoute = "/otp";
  static const String activeAccountRoute = "/activeAccount";
  static const String registerDataViewRoute = "/registerData";
  static const String notificationRoute = "/notification";
  static const String restaurantRoute = "/restaurant";
  static const String restaurantMapRoute = "/restaurant_map";
  static const String mealIngredientsRoute = "/mealIngredients";
  static const String cartRoute = "/cart_view";
  static const String storeRoute = "/store_view";
  static const String storeProductsRoute = "/store_products_view";
  static const String contactUsRoute = "/contact_us";
  static const String offerMealRoute = "/offerMeal";
  static const String trackOrderRoute = "/trackOrder";
  static const String newOrderRoute = "/newOrder";
  static const String orderViewRoute = "/orderView";
  static const String orderDetailsRoute = "/orderDetails";
  static const String myOrdersViewRoute = "/myOrdersView";
  static const String orderInvoicesViewRoute = "/orderInvoicesView";
  static const String orderInvoiceDetailsViewRoute = "/OrderInvoiceDetailsView";
  static const String editProfileRoute = "/editProfile";
  static const String deliveryPricingRoute = "/deliveryPricing";
  static const String deliveryPricingDetailsRoute = "/deliveryPricingDetails";
  static const String confirmUserLocationMapRoute = "/confirmUserLocationMapView";
  static const String trackingDriverRoute = "/trackingDriver";
  static const String favouriteRoute = "/favourite";
  static const String playAudioRoute = "/playAudio";

  static const String forgotPasswordRoute = "/forgotPassword";
  static const String newPasswordRoute = "/newPasswordViewBody";
  static const String mainRoute = "/main";
  static const String selectedCategoryRoute = "/selectedCategory";
  static const String categoryProductRoute = "/CategoryProduct";
  static const String filtersRoute = "/filters";
  static const String storeFilterRoute = "/storeFilter";
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
  static const String aboutRoute = "/about";
  static const String privacyPolicyRoute = "/privacyPolicy";

  appRoutes(context) {
    return {
      Routes.splashRoute: (context) => const SplashView(),
      Routes.initialLocationMapRoute: (context) =>  const InitialLocationMapView(),
      Routes.loginRoute: (context) => const LoginView(),
      Routes.homeRoute: (context) => const HomeView(),
      Routes.registerRoute: (context) => const RegisterView(),
      Routes.otpRoute: (context) => const OtpView(),
      Routes.activeAccountRoute: (context) => const ActiveAccountView(),
      Routes.registerDataViewRoute: (context) => const RegisterDataView(),
      Routes.notificationRoute: (context) => const NotificationView(),
      Routes.restaurantRoute: (context) => const RestaurantView(),
      Routes.restaurantMapRoute: (context) => const RestaurantMapView(),
      Routes.mealIngredientsRoute: (context) => const MealIngredientsView(),
      Routes.cartRoute: (context) => const CartView(),
      Routes.storeRoute: (context) => const StoreView(),
      Routes.storeProductsRoute: (context) => const StoreProductsView(),
      Routes.offerMealRoute: (context) => const OfferMealView(),
      Routes.trackOrderRoute: (context) => const TrackOrderView(),
      Routes.newOrderRoute: (context) => const NewOrderView(),
      Routes.ordersRoute: (context) => const OrderView(),
      Routes.orderDetailsRoute: (context) => const OrderDetailsView(),
      Routes.contactUsRoute: (context) => const ContactUsView(),
      Routes.termsAndConditionsRoute: (context) => const TermsView(),
      Routes.myOrdersViewRoute: (context) => const MyOrdersView(),
      Routes.orderInvoicesViewRoute: (context) => const OrderInvoicesView(),
      Routes.orderInvoiceDetailsViewRoute: (context) => const OrderInvoiceDetailsView(),
      Routes.editProfileRoute: (context) => const EditProfileView(),
      Routes.deliveryPricingRoute: (context) => const DeliveryPricingView(),
      Routes.deliveryPricingDetailsRoute: (context) => const DeliveryPricingDetailsView(),
      Routes.confirmUserLocationMapRoute: (context) => const ConfirmUserLocationMapView(),
      Routes.trackingDriverRoute: (context) => const TrackingDriverView(),
      Routes.favouriteRoute: (context) => const FavouriteView(),
      Routes.playAudioRoute: (context) => const PlayAudio(),

    };
  }
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.initialLocationMapRoute:return MaterialPageRoute(builder: (_) => const InitialLocationMapView());
      case Routes.loginRoute:return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.homeRoute:return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.registerRoute:return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.otpRoute:return MaterialPageRoute(builder: (_) => const OtpView());
      case Routes.activeAccountRoute:return MaterialPageRoute(builder: (_) => const ActiveAccountView());
      case Routes.registerDataViewRoute:return MaterialPageRoute(builder: (_) => const RegisterDataView());
      case Routes.notificationRoute:return MaterialPageRoute(builder: (_) => const NotificationView());
      case Routes.restaurantRoute:return MaterialPageRoute(builder: (_) => const RestaurantView());
      case Routes.restaurantMapRoute:return MaterialPageRoute(builder: (_) => const RestaurantMapView());
      case Routes.mealIngredientsRoute:return MaterialPageRoute(builder: (_) => const MealIngredientsView());
      case Routes.offerMealRoute:return MaterialPageRoute(builder: (_) => const OfferMealView());
      case Routes.trackOrderRoute:return MaterialPageRoute(builder: (_) => const TrackOrderView());
      case Routes.newOrderRoute:return MaterialPageRoute(builder: (_) => const NewOrderView());
      case Routes.ordersRoute:return MaterialPageRoute(builder: (_) => const OrderView());
      case Routes.orderDetailsRoute:
        final String? value = settings.arguments as String?;
        // return MaterialPageRoute(builder: (_) =>  OrderDetailsView(someData: value ??'Default Value',));
        return MaterialPageRoute(builder: (_) =>  const OrderDetailsView());
      case Routes.cartRoute:return MaterialPageRoute(builder: (_) => const CartView());
      case Routes.storeRoute:return MaterialPageRoute(builder: (_) => const StoreView());
      case Routes.storeProductsRoute:return MaterialPageRoute(builder: (_) =>  const StoreProductsView());
      case Routes.contactUsRoute:return MaterialPageRoute(builder: (_) =>  const ContactUsView());
      case Routes.termsAndConditionsRoute:return MaterialPageRoute(builder: (_) =>  const TermsView());
      case Routes.myOrdersViewRoute:return MaterialPageRoute(builder: (_) =>  const MyOrdersView());
      case Routes.orderInvoicesViewRoute:return MaterialPageRoute(builder: (_) =>  const OrderInvoicesView());
      case Routes.orderInvoiceDetailsViewRoute:return MaterialPageRoute(builder: (_) =>  const OrderInvoiceDetailsView());
      case Routes.editProfileRoute:return MaterialPageRoute(builder: (_) =>  const EditProfileView());
      case Routes.deliveryPricingRoute:return MaterialPageRoute(builder: (_) =>  const DeliveryPricingView());
      case Routes.deliveryPricingDetailsRoute:return MaterialPageRoute(builder: (_) =>  const DeliveryPricingDetailsView());
      case Routes.confirmUserLocationMapRoute:return MaterialPageRoute(builder: (_) =>  const ConfirmUserLocationMapView());
      case Routes.trackingDriverRoute:return MaterialPageRoute(builder: (_) =>  const TrackingDriverView());
      case Routes.favouriteRoute:return MaterialPageRoute(builder: (_) =>  const FavouriteView());
      case Routes.playAudioRoute:return MaterialPageRoute(builder: (_) =>  const PlayAudio());

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
