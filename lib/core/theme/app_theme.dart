import 'package:flutter/material.dart';

class AppColors {
  // Soft, calming blues and premium whites
  static const Color backgroundStart = Color(0xFFFEE140); 
  static const Color backgroundEnd = Color(0xFFFA709A); // Use a nice gradient for background contrast
  // A cleaner soft blue gradient for the water app vibe
  static const Color softBlueStart = Color(0xFFE0EAFC);
  static const Color softBlueEnd = Color(0xFFCFDEF3);
  
  static const Color oceanBlue = Color(0xFF2E3192);
  static const Color lightBlue = Color(0xFF1BFFFF);

  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF555555);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'GoogleFonts.poppins().fontFamily', // Will be set in main
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.oceanBlue),
    );
  }

  static const LinearGradient mainBackgroundGradient = LinearGradient(
    colors: [Color(0xFF89f7fe), Color(0xFF66a6ff)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient glassGradient = LinearGradient(
    colors: [
      Colors.white24, // White with 0.2 opacity
      Colors.white10, // White with 0.1 opacity
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient borderGradient = LinearGradient(
    colors: [
      Colors.white54,
      Colors.white12,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
