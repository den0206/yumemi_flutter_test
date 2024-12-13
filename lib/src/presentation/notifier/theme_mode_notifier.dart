import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../_generated/src/presentation/notifier/theme_mode_notifier.g.dart';

// ThemeModeを管理するクラス
@Riverpod(keepAlive: true)
final class ThemeModeNotifer extends _$ThemeModeNotifer {
  @override
  ThemeMode build() {
    // デフォルトは Lightモード
    return ThemeMode.light;
  }

  // テーマモード更新
  void setThemeMode(ThemeMode themeMode) {
    if (state == themeMode) return;
    state = themeMode;
  }
}
