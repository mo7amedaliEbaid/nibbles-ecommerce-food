import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

sealed class UrlFunctions {
  static Future<void> openUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrl(Uri.parse(url));
    } else {
      log("Couldn't Launch Url");
    }
  }
}
