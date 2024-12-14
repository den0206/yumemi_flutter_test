import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yumemi_flutter_test/src/domain/model/sort_type.dart';
import 'package:yumemi_flutter_test/src/infrastructure/local_data_source/account_local_data_source.dart';

import '../../domain/factory/base_factory.dart';

void main() {
  final authLocalDataSource = AccountLocalDataSource();
  final random = RandomFactory();
  setUp(
    () {
      SharedPreferences.setMockInitialValues({});
    },
  );

  group('SortType のテスト', () {
    test('SortType初期値の確認', () async {
      final savedSortType = await authLocalDataSource.loadSortType();
      expect(savedSortType, SortType.bestMatch);
    });
    test('SortType 保存', () async {
      // ランダム値の生成
      final sortType = random.rEnum(SortType.values);
      // ローカル保存
      await authLocalDataSource.saveSortType(sortType);
      final savedSortType = await authLocalDataSource.loadSortType();
      // 保存した値と一致しているか
      expect(savedSortType, sortType);
    });

    test(
      'SortType 削除',
      () async {
        // ランダム値の生成
        final sortType = random.rEnum(SortType.values);
        await authLocalDataSource.saveSortType(sortType);
        final savedSortType = await authLocalDataSource.loadSortType();
        // 保存されているか
        expect(savedSortType, sortType);

        // ローカル削除
        await authLocalDataSource.deleteSortType();
        final deletedSortType = await authLocalDataSource.loadSortType();

        // ローカルに値がない場合は、任意の値が返却されるか
        expect(deletedSortType, SortType.bestMatch);
      },
    );
  });

  group('ThemeMode のテスト', () {
    test('ThemeMode 初期値の確認', () async {
      final savedThemeMode = await authLocalDataSource.loadThemeMode();
      expect(savedThemeMode, ThemeMode.light);
    });
    test('ThemeMode 保存', () async {
      // ランダム値の生成
      final themeMode = random.rEnum(ThemeMode.values);
      await authLocalDataSource.saveThemeMode(themeMode);
      final savedThemeMode = await authLocalDataSource.loadThemeMode();
      expect(savedThemeMode, themeMode);
    });
  });
}
