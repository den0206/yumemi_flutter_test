import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_test/src/core/service/storage_service.dart';
import 'package:yumemi_flutter_test/src/domain/model/sort_type.dart';

part '../../_generated/src/infrastructure/local_data_source/account_local_data_source.g.dart';

@Riverpod(keepAlive: true)
AccountLocalDataSource accountLocalDataSource(Ref ref) {
  return AccountLocalDataSource();
}

// アカウント周りのローカル保存を管理するクラス
class AccountLocalDataSource {
  // ローカル保存: SortType
  Future<SortType> saveSortType(SortType sortType) async {
    await StorageService.sortType.saveString(sortType.name);
    return sortType;
  }

  // ローカル読み込み: SortType
  // データがない場合は SortType.bestMatch が返却される
  Future<SortType> loadSortType() async {
    final sortType = await StorageService.sortType.loadString();
    return SortType.values.firstWhere(
      (e) => e.name == sortType,
      orElse: () => SortType.bestMatch,
    );
  }

  // ローカル削除: SortType
  Future<bool> deleteSortType() async {
    return StorageService.sortType.deleteLocal();
  }

  // ローカル保存: ThemeMode
  Future<bool> saveThemeMode(ThemeMode themeMode) async {
    return StorageService.themeMode.saveString(themeMode.name);
  }

  // ローカル読み込み: ThemeMode
  // データがない場合は ThemeMode.light が返却される
  Future<ThemeMode> loadThemeMode() async {
    final current = await StorageService.themeMode.loadString();
    return ThemeMode.values.firstWhereOrNull((e) => e.name == current) ??
        ThemeMode.light;
  }
}
