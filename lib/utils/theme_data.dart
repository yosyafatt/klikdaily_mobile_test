import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './app_colors.dart';

ThemeData buildKlikDailyTheme(BuildContext context) {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _klikDailyColorScheme,
    accentColor: Colors.grey.shade900,
    primaryColor: AppColors.seaGreen,
    buttonColor: AppColors.seaGreen,
    scaffoldBackgroundColor: AppColors.antiflashWhite,
    cardColor: AppColors.antiflashWhite,
    textSelectionColor: AppColors.chineseYellow,
    errorColor: Colors.red.shade800,
    buttonTheme: ButtonThemeData(
      colorScheme: _klikDailyColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
    iconTheme: _klikDailyIconTheme(base.iconTheme),
    textTheme: GoogleFonts.workSansTextTheme(base.textTheme),
    primaryTextTheme: GoogleFonts.workSansTextTheme(base.textTheme),
    primaryIconTheme: _klikDailyIconTheme(base.primaryIconTheme),
    chipTheme: _klikDailyChipTheme(base.chipTheme),
  );
}

ChipThemeData _klikDailyChipTheme(ChipThemeData origin) {
  return origin.copyWith(
    backgroundColor: AppColors.platinumWhite,
    selectedColor: AppColors.chineseYellow,
    secondarySelectedColor: AppColors.seaGreen,
    labelStyle: GoogleFonts.workSans().copyWith(
      color: AppColors.sonicSilver,
    ),
    secondaryLabelStyle: GoogleFonts.workSans().copyWith(
      color: Colors.white,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    pressElevation: 3,
    brightness: Brightness.light,
  );
}

IconThemeData _klikDailyIconTheme(IconThemeData origin) {
  return origin.copyWith(color: Colors.grey.shade900);
}

ColorScheme _klikDailyColorScheme = ColorScheme(
  primary: AppColors.seaGreen,
  primaryVariant: Colors.grey.shade900,
  secondary: AppColors.oceanGreen,
  secondaryVariant: Colors.grey.shade900,
  surface: AppColors.antiflashWhite,
  background: AppColors.platinumWhite,
  error: Colors.red.shade800,
  onPrimary: Colors.grey.shade100,
  onSecondary: Colors.grey.shade900,
  onSurface: Colors.grey.shade900,
  onBackground: Colors.grey.shade900,
  onError: AppColors.antiflashWhite,
  brightness: Brightness.light,
);
