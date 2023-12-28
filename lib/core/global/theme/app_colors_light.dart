import '/core/global/theme/theme_manger.dart';
import 'package:flutter/material.dart';

Color kPrimaryColor = const Color(0xFF37338D);
const Color kHintColor = Color(0xFF707070);
Color kTextColor = appThemeModeIsDark ? kWhiteColor : const Color(0xFF5E5E5E);
Color kTextDarkColor = const Color(0xFF5D5D5D);
Color kDefaultBackground =
    appThemeModeIsDark ? const Color(0xFF121212) : const Color(0xFFF2F2F2);
Color kDefaultIconColor =
    appThemeModeIsDark ? kWhiteColor : const Color(0xFF707070);
const Color kTextFieldFillColor = Color(0xFFD7D7E4);
const kSuccessColor = Color(0xFF00C851);
const kErrorColor = Color(0xFFff4444);
const kWhiteColor = Color(0xFFFFFFFF);
const kBlackColor = Color(0xFF000000);
const kGoogleButtonColor = Color(0xFF518EF8);
const kShimmerGradientColor = LinearGradient(
  colors: [
    Color(0xFFE0E0E0),
    Color(0xFFD6D6D6),
    Color(0xFFE0E0E0),
  ],
);
