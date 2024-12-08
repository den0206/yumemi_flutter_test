import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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

  void onQueryChanged(String query) {
    state = state.copyWith(query: query);
  }

  /// リポジトリ検索
  Future<void> search() async {
    // 空文字の場合は処理しない
    if (state.query.isEmpty) return;

    // 既に検索中の場合は処理しない
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);
    try {
      // リポジトリ検索
      final response = await _githubApi.searchRepositories(query: state.query);

      debugPrint('リポジトリ数: ${response.totalCount}');
      debugPrint('${response.items}');

      // リポジトリ一覧を更新
      state = state.copyWith(
        repositories: response.items,
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
