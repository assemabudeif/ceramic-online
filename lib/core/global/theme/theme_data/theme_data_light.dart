import '/core/utilities/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors_light.dart';
import '../text_style.dart';

ThemeData get getThemeDataLight => ThemeData.light().copyWith(
      /// Theme Colors
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kDefaultBackground,
      hintColor: kHintColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: kPrimaryColor,
      ),
      colorScheme: ColorScheme.light(
        primary: kPrimaryColor,
        secondary: kPrimaryColor,
        background: kDefaultBackground,
        error: kErrorColor,
      ),

      /// App Bar Theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: kDefaultBackground,
        actionsIconTheme: IconThemeData(
          color: kDefaultIconColor,
        ),
        iconTheme: IconThemeData(
          color: kDefaultIconColor,
        ),
      ),

      /// Text Form Field Theme
      inputDecorationTheme: InputDecorationTheme(
        fillColor: kTextFieldFillColor,
        // filled: true,
        hintStyle: getLightStyle.copyWith(
          color: kHintColor,
          fontSize: 12.sp,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        isDense: true,
        errorStyle: getLightStyle.copyWith(
          color: kErrorColor,
          fontSize: 12.sp,
        ),
        counterStyle: getLightStyle.copyWith(
          color: kTextColor,
          fontSize: 12.sp,
        ),
        helperStyle: getLightStyle,
        labelStyle: getLightStyle.copyWith(
          color: kPrimaryColor,
          fontSize: 12.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: kPrimaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(
            color: kErrorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(
            color: kErrorColor,
          ),
        ),
      ),

      primaryTextTheme: TextTheme(
        titleLarge: getBoldStyle,
        titleMedium: getSemiBoldStyle,
        titleSmall: getMediumStyle.copyWith(fontWeight: kFontWeightBold),
        bodyLarge: getMediumStyle,
        bodyMedium: getRegularStyle,
        bodySmall: getLightStyle,
        displayLarge: getBoldStyle.copyWith(
            fontSize: 32.sp, color: kTextColor.withOpacity(0.8)),
        displayMedium: getBoldStyle.copyWith(
            fontSize: 24.sp, color: kTextColor.withOpacity(0.8)),
        displaySmall: getBoldStyle.copyWith(
            fontSize: 18.sp, color: kTextColor.withOpacity(0.8)),
        headlineLarge: getBoldStyle.copyWith(fontSize: 24.sp),
        headlineMedium: getBoldStyle.copyWith(fontSize: 18.sp),
        headlineSmall: getBoldStyle.copyWith(fontSize: 14.sp),
        labelLarge: getMediumStyle.copyWith(fontSize: 18.sp),
        labelMedium: getMediumStyle.copyWith(fontSize: 14.sp),
        labelSmall: getMediumStyle.copyWith(fontSize: 12.sp),
      ),

      /// Text Theme
      textTheme: TextTheme(
        titleLarge: getBoldStyle,
        titleMedium: getSemiBoldStyle,
        titleSmall: getMediumStyle,
        bodyLarge: getMediumStyle,
        bodyMedium: getRegularStyle,
        bodySmall: getLightStyle,
        displayLarge: getBoldStyle.copyWith(
            fontSize: 32.sp, color: kTextColor.withOpacity(0.8)),
        displayMedium: getBoldStyle.copyWith(
            fontSize: 24.sp, color: kTextColor.withOpacity(0.8)),
        displaySmall: getBoldStyle.copyWith(
            fontSize: 18.sp, color: kTextColor.withOpacity(0.8)),
        headlineLarge: getBoldStyle.copyWith(fontSize: 24.sp),
        headlineMedium: getBoldStyle.copyWith(fontSize: 18.sp),
        headlineSmall: getBoldStyle.copyWith(fontSize: 14.sp),
        labelLarge: getMediumStyle.copyWith(fontSize: 18.sp),
        labelMedium: getMediumStyle.copyWith(fontSize: 14.sp),
        labelSmall: getMediumStyle.copyWith(fontSize: 12.sp),
      ),

      /// Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          textStyle: getRegularStyle,
          minimumSize: Size(0.6.sw, 35.h),
        ),
      ),
    );
