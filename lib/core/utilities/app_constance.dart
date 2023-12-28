import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// App Name and Version Constants
const String kAppName = 'Ceramic Online';
const String kAppVersion = '1.0.0';
const String kAppVersionCode = '1';
const String kAppVersionName = '1.0.0';
const String kAppPackageName = 'com.linegroup.ceramic.online';

/// App Constants
const kDefaultLanguage = 'en';
const kDefaultCountry = 'US';
const kDefaultLocale = Locale(kDefaultLanguage, kDefaultCountry);
const kDefaultPadding = 18.0;
String kAppLanguage = '';

// Animation Constants
const kDefaultRouteTransition = Transition.fadeIn;
const kDefaultTransitionTime = Duration(milliseconds: 300);
const kDefaultAnimationTime = Duration(seconds: 1, milliseconds: 300);
const kSplashDuration = Duration(seconds: 2, milliseconds: 500);
