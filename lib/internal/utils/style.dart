import 'package:flutter/material.dart';

class AppFonts{
  static const String OpenSans = 'OpenSans';
}

class AppTextStyle{
  static const TextStyle openSans = TextStyle(
    fontFamily: AppFonts.OpenSans,
  );

  static const TextStyle montserrat = TextStyle(
    fontWeight: FontWeight.w400,
  );

  static TextStyle get normal => openSans.copyWith(fontSize: 14, color: AppColors.textColor);

  static TextStyle get medium => openSans.copyWith(fontSize: 14, color: AppColors.textColor, fontWeight: FontWeight.w600);

  static TextStyle get bold => openSans.copyWith(fontSize: 14, color: AppColors.textColor, fontWeight: FontWeight.w700);
}

class AppColors {
  static const Color verdigris = Color.fromRGBO(95, 86, 62, 1);
  static const Color grey91 = Color.fromRGBO(232, 232, 232, 1);
  static const Color gradientGreenStart = Color.fromRGBO(186, 255, 146, 1);
  static const Color gradientGreenEnd = Color.fromRGBO(247, 249, 222, 1);
  static const Color white255 = Color.fromRGBO(255, 255, 255, 1);
  static const Color textColor = Color.fromRGBO(36, 34, 34, 1);
  static const Color greenButton = Color.fromRGBO(66, 187, 102, 1);
  static const Color grey174 = Color.fromRGBO(174, 174, 174, 1);
  static const Color circleIndicatorGreen = Color.fromRGBO(58, 216, 201, 1);
  static const Color circleIndicatorOrange = Color.fromRGBO(254, 177, 62, 1);
  static const Color circleIndicatorBlue = Color.fromRGBO(119, 188, 214, 1);
  static const Color circleIndicatorPurple = Color.fromRGBO(188, 138, 255, 1);
  static const Color green110 = Color.fromRGBO(110, 255, 187, 1);
  static const Color specialRed = Color.fromRGBO(255, 0, 0, 1);
  static const Color grey102 = Color.fromRGBO(102, 102, 102, 1);
  static const Color grey217 = Color.fromRGBO(217, 217, 217, 1);
}