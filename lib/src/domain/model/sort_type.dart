import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumemi_flutter_test/src/_generated/src/l10n/app_localizations.dart';
import 'package:yumemi_flutter_test/src/core/service/navigation_service.dart';

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

  String get title {
    final l10n = L10n.of(NavigationService.context);

    // 多言語: SortType.title
    switch (this) {
      case SortType.bestMatch:
        return l10n.best_match;
      case SortType.stars:
        return l10n.stars;
      case SortType.forks:
        return l10n.forks;
      case SortType.helpWantedIssues:
        return l10n.help_wanted;
    }
  }
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
