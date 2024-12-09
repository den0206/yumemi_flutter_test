import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/exception/network_exception.dart';
import 'package:yumemi_flutter_test/src/infrastructure/repository/github_repository.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/github_search_notifier.dart';

import '../../../_generated/src/domain/annotations/repository.mocks.dart';
import '../../../domain/factory/base_factory.dart';
import '../../../domain/factory/github_factory.dart';

void main() {
  final rnd = RandomFactory();
  final mockSearchRepository = MockGithubRepository();

  ProviderContainer makeProviderContainer(
    MockGithubRepository mockSearchRepository,
  ) {
    final container = ProviderContainer(
      overrides: [
        githubRepositoryProvider.overrideWithValue(mockSearchRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUp(
    TestWidgetsFlutterBinding.ensureInitialized,
  );

  test('検索', () async {
    final container = makeProviderContainer(mockSearchRepository);
    final target = container.read(githubSearchNotifierProvider.notifier);

    // レスポンスデータ(Dummy)の生成
    final mockRepsonse = SearchRepositoryResponseFactory().generateFake();

    // ランダムの検索文字列
    final q = rnd.rString;

    when(mockSearchRepository.searchRepositories(query: q)).thenAnswer(
      (_) async => mockRepsonse,
    );

    // 動作: 検索文言の更新
    target.onQueryChanged(q);

    // 動作: 検索
    await target.search();

    // 検証
    expect(target.state.query, q);
    expect(target.state.repositories, mockRepsonse.items);
    expect(target.state.isLoading, false);
  });

  test(
    '検索失敗',
    () async {
      final container = makeProviderContainer(mockSearchRepository);
      final target = container.read(githubSearchNotifierProvider.notifier);

      // ランダムの検索文字列
      final q = rnd.rString;

      // 例外を起こす
      when(mockSearchRepository.searchRepositories(query: q))
          .thenThrow(NetworkException.validationFailed());

      // 動作: 検索文言の更新
      target.onQueryChanged(q);

      // 検証: 例外が返却されるか
      expect(
        () async => target.search(),
        throwsA(NetworkException.validationFailed()),
      );

      expect(target.state.query, q);
      // 検証: 例外処理時: ローディングのフラグが戻っているか
      expect(target.state.isLoading, false);
    },
  );

  test('クリア', () {
    final container = makeProviderContainer(mockSearchRepository);
    final target = container.read(githubSearchNotifierProvider.notifier);

    // ランダムの検索文字列
    final q = rnd.rString;

    // 動作: 検索文言の更新
    target.onQueryChanged(q);

    // 検証: 文言が更新されるか
    expect(target.state.query, q);

    // 動作: クリアする
    target.clear();

    // 検証: Stateがクリアされるか
    expect(target.state.query, '');
    expect(target.state.repositories, []);
    expect(target.state.isLoading, false);
  });
}
