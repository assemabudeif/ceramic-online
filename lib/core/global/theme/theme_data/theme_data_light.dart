import '/core/utilities/app_constance.dart';
import 'package:flutter/material.dart';

ThemeData getThemeDataLight() => ThemeData.light().copyWith(
      /// set default font family
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontFamily: kDefaultFontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),

      primaryTextTheme: ThemeData.light().textTheme.apply(
            fontFamily: kDefaultFontFamily,
          ),
    );
