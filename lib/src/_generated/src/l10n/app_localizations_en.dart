import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get test => 'Test';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get error_occurred => 'Error occurred';

  @override
  String get search_repository => 'Search Repository';

  @override
  String get sort => 'Sort';

  @override
  String get best_match => 'Best Match';

  @override
  String get stars => 'Stars';

  @override
  String get forks => 'Forks';

  @override
  String get help_wanted => 'Help Wanted Issues';

  @override
  String get github_search => 'Github Search';

  @override
  String get not_modified => 'Not Modified(304)';

  @override
  String get validation_failed => 'Validation Failed (422)';

  @override
  String get service_unavailable => 'Service Unavailable (503)';

  @override
  String get no_search_result => 'Search results are 0';

  @override
  String get unknown => 'An unknown error has occurred. (-1)';

  @override
  String get no_internet => 'No Internet Connection';

  @override
  String get timeout => 'Timeout';

  @override
  String get loading_error => 'Please try reloading';

  @override
  String search_result(String query) {
    return 'Results for $query';
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

    return 'Items in $currentString/$totalString';
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

    return 'History: $currentString/$maxString';
  }

  @override
  String get delete_all_queries => 'Are you sure you want to delete all history?';
}
