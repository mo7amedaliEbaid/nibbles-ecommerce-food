import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/models/meal.dart';
import 'package:nibbles_ecommerce/models/meal_category.dart';
import 'package:nibbles_ecommerce/presentation/screens/intro.dart';
import 'package:nibbles_ecommerce/presentation/screens/meal_details.dart';
import 'package:nibbles_ecommerce/presentation/screens/meals.dart';
import 'package:nibbles_ecommerce/presentation/screens/offers.dart';
import 'package:nibbles_ecommerce/presentation/screens/search.dart';
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
  static const String mealDetails = '/mealDetails';
  static const String search = '/search';
  static const String meals = '/meals';
  static const String offers = '/offers';
  static const String subscriptions = '/subscriptions';
  static const String favourites = '/favourites';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String invite = '/invite';
  static const String about = '/about';
  static const String terms = '/terms';
  static const String contact = '/contact';
  static const String privacy = '/privacy';
  static const String signin = '/signin';

  static const List<String> moreScreenTaps = [
    subscriptions,
    profile,
    favourites,
    offers,
    settings,
    invite,
    about,
    terms,
    privacy,
    contact,
  ];

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case ads:
        return MaterialPageRoute(builder: (_) => const AdsScreen());
      case root:
        return MaterialPageRoute(builder: (_) => const RootScreen());
      case signin:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case intro:
        return MaterialPageRoute(builder: (_) => IntroScreen());
      case meals:
        MealCategory mealCategory = routeSettings.arguments as MealCategory;
        return MaterialPageRoute(
            builder: (_) => MealsScreen(mealCategory: mealCategory));
      case mealDetails:
        MealModel mealModel = routeSettings.arguments as MealModel;
        return MaterialPageRoute(
            builder: (_) => MealDetailsScreen(mealModel: mealModel));
      case search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      // TODO: Replace OffersScreen
      case offers:
        return MaterialPageRoute(builder: (_) => const OffersScreen());
      case subscriptions:
        return MaterialPageRoute(builder: (_) => const OffersScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const OffersScreen());
      case favourites:
        return MaterialPageRoute(builder: (_) => const OffersScreen());
      case settings:
        return MaterialPageRoute(builder: (_) => const OffersScreen());
      case invite:
        return MaterialPageRoute(builder: (_) => const OffersScreen());
      case about:
        return MaterialPageRoute(builder: (_) => const OffersScreen());
      case terms:
        return MaterialPageRoute(builder: (_) => const OffersScreen());
      case privacy:
        return MaterialPageRoute(builder: (_) => const OffersScreen());
      case contact:
        return MaterialPageRoute(builder: (_) => const OffersScreen());

      default:
        throw const RouteException('Route not found!');
    }
  }
}
