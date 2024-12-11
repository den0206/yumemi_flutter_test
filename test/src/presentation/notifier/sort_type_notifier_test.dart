import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_test/src/domain/model/sort_type.dart';
import 'package:yumemi_flutter_test/src/presentation/notifier/sort_type_notifier.dart';

import '../../domain/factory/base_factory.dart';

void main() {
  ProviderContainer makeProviderContainer() {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    return container;
  }

  test('init', () async {
    final container = makeProviderContainer();

    // 初期値
    final value = container.read(sortTypeNotifierProvider);

    // デフォルトは仕様書で設定されているSortType.bestMatchか？
    expect(value, SortType.bestMatch);
  });

  test('update', () async {
    final random = RandomFactory();
    final container = makeProviderContainer();
    // SortType をランダムに変更
    final type = random.rEnum(SortType.values);

    final target = container.read(sortTypeNotifierProvider.notifier);

    // SortType を更新
    await target.updateType(type);

    expect(container.read(sortTypeNotifierProvider), type);
  });
}
