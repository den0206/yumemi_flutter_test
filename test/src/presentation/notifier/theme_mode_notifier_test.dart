import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_flutter_test/src/infrastructure/local_data_source/account_local_data_source.dart';
import 'package:yumemi_flutter_test/src/presentation/notifier/theme_mode_notifier.dart';

import '../../_generated/src/domain/annotations/local_data_source.mocks.dart';
import '../../domain/factory/base_factory.dart';

void main() {
  final mockLocalDataSource = MockAccountLocalDataSource();

  // ランダム値
  final defaultValue = RandomFactory().rEnum(ThemeMode.values);

  ProviderContainer makeProviderContainer(
    MockAccountLocalDataSource mockLocalDataSource,
  ) {
    final container = ProviderContainer(
      overrides: [
        themeModeNotiferProvider
            .overrideWith(() => ThemeModeNotifier(defaultValue)),
        accountLocalDataSourceProvider.overrideWithValue(mockLocalDataSource),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  test('初期化', () async {
    final container = makeProviderContainer(mockLocalDataSource);
    final value = container.read(themeModeNotiferProvider);
    // デフォルトはLightモードであるか
    expect(value, defaultValue);
  });

  test('更新', () async {
    const mode = ThemeMode.dark;
    when(mockLocalDataSource.saveThemeMode(mode)).thenAnswer((_) async => true);

    final container = makeProviderContainer(mockLocalDataSource);
    final notifier = container.read(themeModeNotiferProvider.notifier);

    await notifier.setThemeMode(mode);
    // テーマモードが更新されているか?
    expect(container.read(themeModeNotiferProvider), mode);
  });
}
