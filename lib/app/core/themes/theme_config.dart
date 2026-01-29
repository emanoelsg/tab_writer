// app/core/themes/theme_config.dart
import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'LexendGiga',
      
      // Esquema de Cores Baseado no Design
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.accent,          // Laranja de ação
        onPrimary: Colors.white,
        secondary: AppColors.iconColor,     // Marrom dos ícones
        onSecondary: Colors.white,
        surface: AppColors.homeBackground,  // Fundo bege acinzentado
        onSurface: Colors.black87,
        error: AppColors.error,
        onError: Colors.white,
        outline: AppColors.searchBar,
      ),

      scaffoldBackgroundColor: AppColors.homeBackground,

      // Estilo da AppBar (Baseado na Home)
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

      // Estilo dos Cards (As "Notes" amareladas do seu print)
      cardTheme: CardThemeData(
        color: AppColors.cardYellow,
        elevation: 0, // No print parece flat com bordas sutis
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.black, width: 1),
        ),
      ),

      // Estilo da Barra de Busca
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

      // Tipografia Mapeada
      textTheme: const TextTheme(
        // Títulos das Tablaturas (Black 900)
        displaySmall: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.black87,
        ),
        // Texto dentro das abas (Medium 500)
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
        // Rótulos menores (Light 300)
        labelMedium: TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.black54,
        ),
      ),
    );
  }
}