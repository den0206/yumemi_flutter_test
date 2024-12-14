import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_flutter_test/src/infrastructure/local_data_source/account_local_data_source.dart';
import 'package:yumemi_flutter_test/src/presentation/notifier/query_history_notifier.dart';

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

  test(
    '検索履歴がない場合の初期化',
    () async {
      final container = makeProviderContainer(mockLocalDataSource);

      when(mockLocalDataSource.loadQueries()).thenAnswer((_) async => []);

      final value = await container.read(queryHistoryNotifierProvider.future);

      expect(value.isEmpty, true);
    },
  );

  test(
    '検索履歴がある場合の初期化',
    () async {
      final container = makeProviderContainer(mockLocalDataSource);

      final local = List.generate(6, (_) => random.rString);
      when(mockLocalDataSource.loadQueries()).thenAnswer((_) async => local);

      final value = await container.read(queryHistoryNotifierProvider.future);

      expect(value, local);
    },
  );

  test(
    '検索履歴の追加',
    () async {
      final container = makeProviderContainer(mockLocalDataSource);

      final local = List.generate(6, (_) => random.rString);

      when(mockLocalDataSource.saveQuery(local.first))
          .thenAnswer((_) async => local);

      final notifier = container.read(queryHistoryNotifierProvider.notifier);
      await notifier.addHistory(local.first);

      final value = await container.read(queryHistoryNotifierProvider.future);

      expect(value.contains(local.first), true);
      expect(value.length, local.length);
    },
  );

  test(
    '単一履歴の削除',
    () async {
      final container = makeProviderContainer(mockLocalDataSource);

      final local = List.generate(6, (_) => random.rString);
      final expected = local.where((e) => e != local.first).toList();

      when(mockLocalDataSource.deleteQuery(local.first))
          .thenAnswer((_) async => expected);

      final notifier = container.read(queryHistoryNotifierProvider.notifier);

      await notifier.delete(local.first);

      final value = await container.read(queryHistoryNotifierProvider.future);

      expect(value.contains(local.first), false);
      expect(value.length, expected.length);
      expect(value, expected);
    },
  );

  test(
    '全履歴の削除',
    () async {
      final container = makeProviderContainer(mockLocalDataSource);

      final local = List.generate(6, (_) => random.rString);

      when(mockLocalDataSource.loadQueries()).thenAnswer((_) async => local);

      final current = await container.read(queryHistoryNotifierProvider.future);

      expect(current, local);

      final notifier = container.read(queryHistoryNotifierProvider.notifier);

      await notifier.deleteAll();

      final value = await container.read(queryHistoryNotifierProvider.future);

      expect(value.isEmpty, true);
    },
  );
}
