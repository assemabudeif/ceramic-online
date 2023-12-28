import 'package:firebase_core/firebase_core.dart';

import '/core/app.dart';
import 'package:flutter/material.dart';
import 'core/global/language/language_manger.dart';
import 'core/services/notifications_service.dart';
import 'core/services/services_locator.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationsService.initialize();
  await firstTimeForLanguage();

  runApp(const CeramicOnlineApp());
}
