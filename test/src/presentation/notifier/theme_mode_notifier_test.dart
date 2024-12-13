import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_test/src/presentation/notifier/theme_mode_notifier.dart';

void main() {
  ProviderContainer makeProviderContainer() {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    return container;
  }

  test('init', () async {
    const defaultValue = ThemeMode.light;

    final container = makeProviderContainer();
    final value = container.read(themeModeNotiferProvider);

    // デフォルトはLightモードであるか
    expect(value, defaultValue);
  });

  test('update', () async {
    const mode = ThemeMode.dark;

    final container = makeProviderContainer();
    final notifier = container.read(themeModeNotiferProvider.notifier);

    notifier.setThemeMode(mode);

    // テーマモードが更新されているか?
    expect(container.read(themeModeNotiferProvider), mode);
  });
}
