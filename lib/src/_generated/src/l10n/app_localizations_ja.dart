import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get test => 'テスト';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'キャンセル';

  @override
  String get error_occurred => 'エラーが発生しました';

  @override
  String get search_repository => 'リポジトリ検索';

  @override
  String get sort => '並び替え';

  @override
  String get best_match => 'ベストマッチ';

  @override
  String get stars => 'スター数';

  @override
  String get forks => 'フォーク数';

  @override
  String get help_wanted => 'イシュー数';

  @override
  String get github_search => 'Github 検索';

  @override
  String get not_modified => 'Not Modified(304)';

  @override
  String get validation_failed => 'Validation Failed (422)';

  @override
  String get service_unavailable => 'サービス利用不可 (503)';

  @override
  String get no_search_result => '検索結果は0件です';

  @override
  String get unknown => '不明なエラー (-1)';

  @override
  String get no_internet => 'インターネットに接続されていないようです';

  @override
  String get timeout => 'タイムアウト';

  @override
  String get loading_error => '再読み込みをお試しください';

  @override
  String search_result(String query) {
    return '$query の検索結果';
  }

  @override
  String search_length(int current, int total) {
    final intl.NumberFormat currentNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String currentString = currentNumberFormat.format(current);
    final intl.NumberFormat totalNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String totalString = totalNumberFormat.format(total);

    return '$currentString件/$totalString件表示中';
  }

  @override
  String query_history(int current, int max) {
    final intl.NumberFormat currentNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String currentString = currentNumberFormat.format(current);
    final intl.NumberFormat maxNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String maxString = maxNumberFormat.format(max);

    return '履歴 $currentString/$maxString';
  }

  @override
  String get delete_all_queries => '履歴を全て削除しますか?';
}
