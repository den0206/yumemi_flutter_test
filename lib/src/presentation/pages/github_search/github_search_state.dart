import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/response.dart';

part '../../../_generated/src/presentation/pages/github_search/github_search_state.freezed.dart';
part '../../../_generated/src/presentation/pages/github_search/github_search_state.g.dart';

@freezed
class GithubSearchState with _$GithubSearchState {
  const factory GithubSearchState({
    @Default('') String query,
    @Default([]) List<RepositorySchema> repositories,
    @Default(0) int totalCount,
    @Default(1) int page,
    @Default(false) bool isLoading,
  }) = _GithubSearchState;
  factory GithubSearchState.fromJson(Map<String, dynamic> json) =>
      _$GithubSearchStateFromJson(json);
}

extension SearchPageStateExt on GithubSearchState {
  // 次の検索結果が存在するか？
  bool get hasNextPage {
    return totalCount > repositories.length;
  }

  // ページネーションの為に次の検索結果がある場合はLoading用のCellを表示
  int get itemCount {
    return repositories.length + (hasNextPage ? 1 : 0);
  }
}
