// app/core/themes/theme_config.dart

import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'LexendGiga',
      
      
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.accent,          
        onPrimary: Colors.white,
        secondary: AppColors.iconColor,     
        onSecondary: Colors.white,
        surface: AppColors.homeBackground,  
        onSurface: Colors.black87,
        error: AppColors.error,
        onError: Colors.white,
        outline: AppColors.searchBar,
      ),

      scaffoldBackgroundColor: AppColors.homeBackground,

      
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black54),
        titleTextStyle: TextStyle(
          fontFamily: 'LexendGiga',
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),

      
      cardTheme: CardThemeData(
        color: AppColors.cardYellow,
        elevation: 0, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.black, width: 1),
        ),
      ),

      
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.searchBar,
        prefixIconColor: Colors.white70,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),

      
      textTheme: const TextTheme(
        
        displaySmall: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.black87,
        ),
        
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
        
        labelMedium: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.black54,
        ),
      ),
    );
  }
}