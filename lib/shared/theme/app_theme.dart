import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: _appBarTheme,
      colorScheme: _colorScheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      filledButtonTheme: _filledButtonTheme,
      textButtonTheme: _textButtonTheme,
      dividerTheme: _dividerTheme,
    );
  }

  static ColorScheme get _colorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,
      onPrimary: Color(0xffFFFFFF),
      primaryContainer: Colors.black12,
      onPrimaryContainer: Colors.black,
      secondary: Color(0xFFF3E2CC),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdfa3b7),
      tertiary: Color(0xffb6c2ff),
      tertiaryContainer: Color(0xffffffff),
      errorContainer: Color(0xfffcd8df),
      onErrorContainer: Color(0xff000000),
      surfaceVariant: Color(0xffeeeeee),
      outline: Color(0xff737373),
      outlineVariant: Color(0xffbfbfbf),
      inverseSurface: Color(0xff121212),
      surfaceTint: Color(0xff909cdf),
      error: Color(0xFF5e162e),
      onError: Color(0xFFf5e9ed),
      background: Color(0xFFFFFFFF),
      onBackground: Color(0xff000000),
      surface: Color(0xFFf4f5fc),
      onSurface: Color(0xFF0e1016),
    );
  }

  static TextTheme get _textTheme {
    const textTheme = TextTheme();

    final bodyFont = GoogleFonts.ibmPlexSansTextTheme(textTheme);
    final headingFont = GoogleFonts.syneMonoTextTheme(textTheme);

    return bodyFont.copyWith(
      displayLarge: headingFont.displayLarge,
      displayMedium: headingFont.displayMedium,
      displaySmall: headingFont.displaySmall,
      headlineLarge: headingFont.headlineLarge,
      headlineMedium: headingFont.headlineMedium,
      headlineSmall: headingFont.headlineSmall,
      bodyLarge: bodyFont.bodyLarge,
      bodyMedium: bodyFont.bodyMedium,
      bodySmall: bodyFont.bodySmall,
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
    );
  }

  static DividerThemeData get _dividerTheme {
    return DividerThemeData(color: _colorScheme.surfaceVariant);
  }

  static FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: _textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  static TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: _textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: _colorScheme.surfaceVariant,
      contentPadding: const EdgeInsets.all(8.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: _enabledBorder,
      focusedBorder: _focusedBorder,
      disabledBorder: _disabledBorder,
    );
  }

  static InputBorder get _enabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: const BorderSide(color: Colors.transparent),
      );

  static InputBorder get _focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide.none,
      );

  static InputBorder get _disabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.0),
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
      );
}
