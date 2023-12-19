import 'package:flutter/material.dart';

import '../../../utilities/app_constance.dart';

ThemeData getThemeDataDark() => ThemeData.dark().copyWith(
      /// set default font family
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontFamily: kDefaultFontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),

      primaryTextTheme: ThemeData.dark().textTheme.apply(
            fontFamily: kDefaultFontFamily,
          ),
    );
