import 'package:freezed_annotation/freezed_annotation.dart';

enum SortType {
  // ベストマッチ数
  bestMatch('bestmatch'),
  // スター数
  stars('stars'),
  //フォーク数
  forks('forks'),
  // イシュー数
  helpWantedIssues('help-wanted-issues');

  const SortType(this.queryValue);

  final String queryValue;
}

final class SortTypeConverter implements JsonConverter<SortType, String> {
  const SortTypeConverter();

  @override
  SortType fromJson(String value) {
    return SortType.values.firstWhere(
      (e) => e.queryValue == value,
      orElse: () => SortType.bestMatch,
    );
  }

  @override
  String toJson(SortType object) {
    return object.queryValue;
  }
}
