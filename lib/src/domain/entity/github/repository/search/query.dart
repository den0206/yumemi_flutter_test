import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../../_generated/src/domain/entity/github/repository/search/query.freezed.dart';
part '../../../../../_generated/src/domain/entity/github/repository/search/query.g.dart';

@freezed
class SearchRepositoryQuery with _$SearchRepositoryQuery {
  const factory SearchRepositoryQuery({
    required String q,
    int? page,
  }) = _SearchRepositoryQuery;
  const SearchRepositoryQuery._();
  factory SearchRepositoryQuery.fromJson(Map<String, dynamic> json) =>
      _$SearchRepositoryQueryFromJson(json);

  // クエリパラメータへの変換
  Map<String, String> get toQuery {
    final query = <String, String>{'q': q};
    if (page != null) query['page'] = page!.toString();
    return query;
  }
}
