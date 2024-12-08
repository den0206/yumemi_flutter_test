import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/response.dart';

part '../../../_generated/src/presentation/pages/github_search/github_search_state.freezed.dart';
part '../../../_generated/src/presentation/pages/github_search/github_search_state.g.dart';

@freezed
class GithubSearchState with _$GithubSearchState {
  const factory GithubSearchState({
    @Default('') String query,
    @Default([]) List<RepositorySchema> repositories,
    @Default(false) bool isLoading,
  }) = _GithubSearchState;
  factory GithubSearchState.fromJson(Map<String, dynamic> json) =>
      _$GithubSearchStateFromJson(json);
}
