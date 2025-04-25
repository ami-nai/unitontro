import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme{
  static ThemeData get lightTheme {
    return ThemeData(

      // Define your light theme properties

      brightness: Brightness.light,
      primaryColor: const Color.fromRGBO(183, 228, 200, 100),
      scaffoldBackgroundColor: const Color(0xFFE6F5EC),
      
      colorScheme: ColorScheme.light(
        primary: const Color.fromRGBO(183, 228, 200, 100),
        secondary: Colors.blue.shade600,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.teal[900],
        foregroundColor: Colors.white,
      ),
      
      textTheme: GoogleFonts.sourceCodeProTextTheme(
        
        const TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
          bodySmall: TextStyle(fontSize: 14, color: Colors.white70),
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),

      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue.shade800,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(

      // Define your dark theme properties

      brightness: Brightness.dark,
      primaryColor: Colors.blue.shade300,
      scaffoldBackgroundColor: const Color.fromRGBO(226, 11, 83, 0.612),

      colorScheme: ColorScheme.dark(
        primary: const Color.fromRGBO(183, 228, 200, 100),
        secondary: Colors.blue.shade200,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.white,
      ),

      textTheme: GoogleFonts.sourceCodeProTextTheme(
        const TextTheme(
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 18, color: Colors.white70),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
        bodySmall: TextStyle(fontSize: 14, color: Colors.white70),
        titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
        labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      // Add other theme properties as needed
      ),
      );
  }
}

// In app_theme.dart or a new file like app_colors.dart

extension CustomColors on ColorScheme {
  Color get success => const Color(0xFF28A745);
  Color get warning => const Color(0xFFFFC107);
  Color get danger => const Color(0xFFDC3545);
}

extension CustomTextStyles on TextTheme {
  TextStyle get captionBold => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      );
}
