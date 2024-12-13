import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_test/src/infrastructure/local_data_source/account_local_data_source.dart';

final themeModeNotiferProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  () => throw UnimplementedError(),
);

// ThemeModeを管理するクラス
final class ThemeModeNotifier extends Notifier<ThemeMode> {
  ThemeModeNotifier(this._defaultThemeMode);

  final ThemeMode _defaultThemeMode;

  @override
  ThemeMode build() {
    // デフォルトは main で ローカル値を取得する
    // ローカルに値がない場合はThemeMode.Light
    return _defaultThemeMode;
  }

  AccountLocalDataSource get _accountLocalDataSource =>
      ref.read(accountLocalDataSourceProvider);

  // テーマモード更新
  Future<void> setThemeMode(ThemeMode themeMode) async {
    if (state == themeMode) return;
    // テーマモードのローカル保存
    await _accountLocalDataSource.saveThemeMode(themeMode);
    state = themeMode;
  }
}
