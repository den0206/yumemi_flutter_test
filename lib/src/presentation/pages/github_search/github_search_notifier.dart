import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/exception/network_exception.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/query.dart';
import 'package:yumemi_flutter_test/src/domain/model/order_type.dart';
import 'package:yumemi_flutter_test/src/infrastructure/repository/github_repository.dart';
import 'package:yumemi_flutter_test/src/presentation/notifier/query_history_notifier.dart';
import 'package:yumemi_flutter_test/src/presentation/notifier/sort_type_notifier.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/github_search_state.dart';

part '../../../_generated/src/presentation/pages/github_search/github_search_notifier.g.dart';

// リポジトリ検索画面の操作を管理するクラス
@riverpod
final class GithubSearchNotifier extends _$GithubSearchNotifier {
  @override
  GithubSearchState build() {
    return const GithubSearchState();
  }

  GithubRepository get _githubApi => ref.read(githubRepositoryProvider);

  Future<SearchRepositoryQuery> get _query async => SearchRepositoryQuery(
        // 検索文言
        q: state.query,
        // 現在のページ
        page: state.page,
        // 並び替え
        sort: await ref.read(sortTypeNotifierProvider.future),
        // 今回の実装では、`降順(固定値)` のみ対応
        order: OrderType.desc,
        // 今回の実装では、`20(固定値)` のみ対応
        perPage: 20,
      );

  void onQueryChanged(String query) {
    state = state.copyWith(query: query);
  }

  /// リポジトリ検索
  Future<void> search() async {
    // 空文字の場合は処理しない
    if (state.query.isEmpty) return;

    // 既に検索中の場合は処理しない
    if (state.isLoading) return;

    // ページネーションとして検索を行うか
    final isPaging = state.repositories.isNotEmpty;

    // ページネーション動作であり,次の検索結果がない場合は処理終了
    if (isPaging && !state.hasNextPage) return;

    state = state.copyWith(isLoading: true);
    try {
      // リポジトリ検索
      final response = await _githubApi.searchRepositories(await _query);

      if (response.totalCount == 0 && state.page == 1) {
        // 検索結果が0件の場合
        throw NetworkException.notFoundRepository();
      }

      if (!isPaging) {
        // 初回検索時に検索履歴に追加
        await ref
            .read(queryHistoryNotifierProvider.notifier)
            .addHistory(state.query);
      }

      // Stateを更新
      state = state.copyWith(
        repositories: [...state.repositories, ...response.items],
        totalCount: response.totalCount,
        page: state.page + 1,
      );
    } catch (e) {
      rethrow;
    } finally {
      // 既に検索中のフラグを解除
      state = state.copyWith(isLoading: false);
    }
  }

  void clear() {
    state = const GithubSearchState();
  }
}
