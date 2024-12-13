import 'package:flutter/material.dart';

// ThemeMode 拡張
extension ThemeDataExt on ThemeMode {
  // Light Mode の設定を纏める
  ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
        ),
      );

  // Dark Mode の設定を纏める
  ThemeData get dark => ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
        ),
      );
}
