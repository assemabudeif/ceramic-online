import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '/core/app.dart';
import 'package:flutter/material.dart';
import 'core/global/language/language_manger.dart';
import 'core/services/notifications_service.dart';
import 'core/services/services_locator.dart';
import 'core/utilities/bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationsService.initialize();
  await firstTimeForLanguage();
  Bloc.observer = AppBlocObserver();

  runApp(Phoenix(child: const CeramicOnlineApp()));
}
