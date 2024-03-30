import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors/app_colors.dart';
import '../app_dimens/app_dimens.dart';

class AppTheme {
  //  AppTheme._();

  static ThemeData get theme {
    final themeData = ThemeData.light();
    final textTheme = themeData.textTheme;

    return ThemeData(
        fontFamily: "Nunito",
        textTheme: textTheme.copyWith(
          bodyLarge: const TextStyle(
            color: AppColors.white,
            fontSize: AppDimens.font50,
            fontWeight: FontWeight.bold,
            letterSpacing: 5,
          ),
          bodyMedium: const TextStyle(
            color: AppColors.white,
            fontSize: AppDimens.font20,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: const TextStyle(
            color: AppColors.blueDark,
            fontSize: AppDimens.font16,
            fontWeight: FontWeight.bold,
          ),
          displayLarge: const TextStyle(
            color: AppColors.black,
            fontSize: AppDimens.font20,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: const TextStyle(
            color: AppColors.black,
            fontSize: AppDimens.font18,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: const TextStyle(
            color: AppColors.black,
            fontSize: AppDimens.font16,
            fontWeight: FontWeight.bold,
          ),
          labelSmall: const TextStyle(
            color: AppColors.white,
            fontSize: AppDimens.font16,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: const ColorScheme.light(
          background: AppColors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.blueDark,
          titleTextStyle: TextStyle(
            color: AppColors.blueLight,
            fontFamily: "Kalnia_Expanded-Bold",
            fontWeight: FontWeight.bold,
            fontSize: AppDimens.font18,
          ),
          actionsIconTheme: const IconThemeData(
            color: AppColors.purple_200,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(150.w, 35.h),
            shadowColor: AppColors.blueDark,
            backgroundColor:
                const Color.fromARGB(255, 91, 189, 250).withOpacity(1),
            textStyle: const TextStyle(
              color: AppColors.white,
              fontSize: AppDimens.font18,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          errorStyle: const TextStyle(color: AppColors.red),
          // fillColor: AppColors.purple_200,
          iconColor: AppColors.blueDark,
          suffixIconColor: AppColors.blueDark,
          prefixIconColor: AppColors.blueDark,
          outlineBorder: const BorderSide(
            color: AppColors.blueDark,
          ),
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: AppColors.blueDark,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: AppColors.blueDark,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: AppColors.blueDark,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: AppColors.blueDark,
            ),
          ),
        ),
        dropdownMenuTheme: const DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            fillColor: AppColors.blueDark,
          ),
        ),
        drawerTheme: DrawerThemeData(
            backgroundColor: AppColors.blueDark.withOpacity(0.7)));
  }
}
