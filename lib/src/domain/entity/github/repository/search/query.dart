import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumemi_flutter_test/src/domain/model/order_type.dart';
import 'package:yumemi_flutter_test/src/domain/model/sort_type.dart';

part '../../../../../_generated/src/domain/entity/github/repository/search/query.freezed.dart';
part '../../../../../_generated/src/domain/entity/github/repository/search/query.g.dart';

@freezed
class SearchRepositoryQuery with _$SearchRepositoryQuery {
  const factory SearchRepositoryQuery({
    required String q,
    int? page,
    int? perPage,
    @SortTypeConverter() SortType? sort,
    OrderType? order,
  }) = _SearchRepositoryQuery;
  const SearchRepositoryQuery._();
  factory SearchRepositoryQuery.fromJson(Map<String, dynamic> json) =>
      _$SearchRepositoryQueryFromJson(json);

  // クエリパラメータへの変換
  Map<String, String> get toQuery {
    return Map.fromEntries(
      toJson().entries.where((e) => e.value != null).map(
        (entry) {
          return MapEntry(entry.key, entry.value.toString());
        },
      ),
    );
  }
}
