import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/query.dart';
import 'package:yumemi_flutter_test/src/infrastructure/repository/github_repository.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/github_search_state.dart';

part '../../../_generated/src/presentation/pages/github_search/github_search_notifier.g.dart';

@riverpod
final class GithubSearchNotifier extends _$GithubSearchNotifier {
  @override
  GithubSearchState build() {
    return const GithubSearchState();
  }

  GithubRepository get _githubApi => ref.read(githubRepositoryProvider);

  SearchRepositoryQuery get _query => SearchRepositoryQuery(
        // 検索文言
        q: state.query,
        // 現在のページ
        page: state.page,
      );

  void onQueryChanged(String query) {
    state = state.copyWith(query: query);
  }

  /// リポジトリ検索
  Future<void> search({bool isPaging = false}) async {
    // 空文字の場合は処理しない
    if (state.query.isEmpty) return;

    // 既に検索中の場合は処理しない
    if (state.isLoading) return;

    // ページネーション動作であり,次の検索結果がない場合は処理終了
    if (isPaging && !state.hasNextPage) return;

    state = state.copyWith(isLoading: true);
    try {
      // リポジトリ検索
      final response = await _githubApi.searchRepositories(_query);

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
