import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // it won't work for some emulators.
  // change emulators or use physical device.
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  Bloc.observer = NibblesBlocObserver();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    await setupFlutterNotifications();
  }
  runApp(const MyApp());
}
