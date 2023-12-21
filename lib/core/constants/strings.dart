import 'package:flutter/material.dart';

sealed class AppStrings {
  static const String fontFamily = 'Form';
  static const String loading = "LOADING";
  static const String wait = "Wait...";

  // static const List<String> tabStrings = ['Breakfast', 'Lunch', 'Dinner', 'Drinks', 'Snacks','Desert'];
  static const List<String> moreScreenStrings = [
    'My Subscriptions',
    'My Profile',
    'Favorites',
    'Offers',
    'Settings',
    'Invite a Friend',
    'About Nibbles',
    'Terms & Conditions',
    'Privacy Policies',
    'Contact Us',
  ];

  static const String gitUrl = "https://github.com/mo7amedaliEbaid";
  static const String linkedUrl = "https://www.linkedin.com/in/mo7amedebaid/";
  static const String nibblesUrl =
      "https://github.com/mo7amedaliEbaid/nibbles-ecommerce";

  static const List<String> socialUrls = [
    gitUrl,
    linkedUrl,
    nibblesUrl,
  ];

  static const String location = "Egypt, Cairo, New Cairo";
  static const String phone = "+201016381636";

  static const List<String> contactInfo = [
    location,
    phone,
  ];
}

//final GlobalKey globalKey = GlobalKey();
