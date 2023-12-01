import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/presentation/screens/intro.dart';
import 'package:nibbles_ecommerce/presentation/screens/signin.dart';

import '../../presentation/screens/ads.dart';
import '../../presentation/screens/root.dart';
import '../../presentation/screens/splash.dart';
import '../error/exceptions.dart';


sealed class AppRouter {
  static const String splash = '/';
  static const String ads = '/ads';
  static const String root = '/root';
  static const String intro = '/intro';
  static const String productDetails = '/product-details';
  static const String search = '/search';
  static const String filter = '/filter';
  static const String signup = '/signup';
  static const String signin = '/signin';
  static const String adress = '/adress';
  static const String addadress = '/addadress';
  static const String checkout = '/checkout';
  static const String contact = '/contact';
  static const String appinfo = '/appinfo';
  static const String cart = '/cart';
  static const String wishlist = '/wishlist';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case ads:
        return MaterialPageRoute(builder: (_) => const AdsScreen());
      case root:
        return MaterialPageRoute(builder: (_) =>  RootScreen());
      case signin:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case intro:
        return MaterialPageRoute(builder: (_) =>  IntroScreen());
    /*case search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case filter:
        return MaterialPageRoute(builder: (_) => const FilterScreen());
      case productDetails:
        ProductEntity product = routeSettings.arguments as ProductEntity;
        return MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: product));
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case contact:
        return MaterialPageRoute(builder: (_) =>  ContactScreen());
      case cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case adress:
        return MaterialPageRoute(builder: (_) => const AdressScreen());
      case addadress:
        DeliveryInfo? deliveryInfo = routeSettings.arguments as DeliveryInfo?;
        return MaterialPageRoute(
            builder: (_) => AddAdressScreen(
                  deliveryInfo: deliveryInfo,
                ));
      case checkout:
        List<CartItem> items = routeSettings.arguments as List<CartItem>;
        return MaterialPageRoute(
            builder: (_) => CheckOutScreen(
                  items: items,
                ));
      case appinfo:
        String screenTitle = routeSettings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => AppInfoScreen(
                  screenTitle: screenTitle,
                ));
      case wishlist:
        return MaterialPageRoute(builder: (_) => WishListScreen());*/
      default:
        throw const RouteException('Route not found!');
    }
  }
}
