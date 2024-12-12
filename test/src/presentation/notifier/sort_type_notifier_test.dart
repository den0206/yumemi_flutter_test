import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_flutter_test/src/domain/model/sort_type.dart';
import 'package:yumemi_flutter_test/src/infrastructure/local_data_source/account_local_data_source.dart';
import 'package:yumemi_flutter_test/src/presentation/notifier/sort_type_notifier.dart';

import '../../_generated/src/domain/annotations/local_data_source.mocks.dart';
import '../../domain/factory/base_factory.dart';

void main() {
  final random = RandomFactory();
  final mockLocalDataSource = MockAccountLocalDataSource();

  ProviderContainer makeProviderContainer(
    MockAccountLocalDataSource mockLocalDataSource,
  ) {
    final container = ProviderContainer(
      overrides: [
        accountLocalDataSourceProvider.overrideWithValue(mockLocalDataSource),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  test('init', () async {
    // SortType をランダムに変更
    final type = random.rEnum(SortType.values);
    when(mockLocalDataSource.loadSortType()).thenAnswer((realInvocation) async {
      return type;
    });

    final container = makeProviderContainer(mockLocalDataSource);

    // 初期値
    final value = await container.read(sortTypeNotifierProvider.future);
    // デフォルトはローカルストレージから返却されるSortTypeか？
    expect(value, type);
  });

  test('update', () async {
    final container = makeProviderContainer(mockLocalDataSource);
    // SortType をランダムに変更
    final type = random.rEnum(SortType.values);

    final target = container.read(sortTypeNotifierProvider.notifier);

    when(mockLocalDataSource.saveSortType(any))
        .thenAnswer((realInvocation) async {
      return type;
    });

    // SortType を更新
    await target.updateType(type);

    expect(await container.read(sortTypeNotifierProvider.future), type);
  });
}
