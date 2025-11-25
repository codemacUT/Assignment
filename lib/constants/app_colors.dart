import 'package:flutter/material.dart';

/// Defines the color palette used throughout the app.
class AppColors {
  static const Color backgroundBlack = Color(0xFF070707);
  static const Color scaffoldBackground = Color(0xFF070707);
  static const Color cardBackground = Color(0xFF1E1E1E);
  static const Color primaryRed = Color(0xFFD7333A);
  static const Color brightRed = Color(0xFFFF0000);
  static const Color textGrey = Color(0xFF7E7E7E);
  static const Color darkContainer = Color(0xFF181818);
  static const Color mediumContainer = Color(0xFF242424);
  static const Color lightContainer = Color(0xFF323232);
  static const Color borderColor = Color(0xFF292728);

  static const LinearGradient redGradient = LinearGradient(
    begin: Alignment(0.00, -1.00),
    end: Alignment(0, 1),
    colors: [Color(0xFFD7333A), Color(0xFF520001)],
  );
}
