import 'package:flutter/material.dart';
import 'package:luxury_golf_app/core/styles/app_colors.dart';

import 'app_fonts.dart';
import 'app_styles.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    fontFamily: AppFonts.mainFont,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.white),
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    textTheme: TextTheme(
      titleLarge: AppTextStyles.primaryTextStyle,
      titleSmall: AppTextStyles.subTextStyle,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.blue055,
      unselectedItemColor: AppColors.grey585,
      showUnselectedLabels: true,
    ),
  );
}
