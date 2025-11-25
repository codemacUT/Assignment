import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Defines the text styles used throughout the app.
class AppTextStyles {
  static const TextStyle bodySmall = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodySmallGrey = TextStyle(
    color: AppColors.textGrey,
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle headerLarge = TextStyle(
    color: Colors.white,
    fontSize: 16.67,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle labelRed = TextStyle(
    color: AppColors.brightRed,
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );
  
  static const TextStyle monoSmall = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontFamily: 'Suisse Int\'l Mono',
    fontWeight: FontWeight.w400,
  );
  
  static const TextStyle monoTiny = TextStyle(
    color: Colors.white,
    fontSize: 10,
    fontFamily: 'Suisse Int\'l Mono',
    fontWeight: FontWeight.w400,
  );
}
