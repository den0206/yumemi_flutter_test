import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class L10nZh extends L10n {
  L10nZh([String locale = 'zh']) : super(locale);

  @override
  String get test => '测试';

  @override
  String get ok => '确定';

  @override
  String get cancel => '取消';

  @override
  String get error_occurred => '发生错误';

  @override
  String get search_repository => '搜索仓库';

  @override
  String get sort => '排序';

  @override
  String get best_match => '最佳匹配';

  @override
  String get stars => '星数';

  @override
  String get forks => '叉数';

  @override
  String get help_wanted => '問題数';

  @override
  String get github_search => 'Github 搜索';

  @override
  String get not_modified => 'Not Modified(304)';

  @override
  String get validation_failed => 'Validation Failed (422)';

  @override
  String get service_unavailable => '服务不可用 (503)';

  @override
  String get no_search_result => '搜索结果为0';

  @override
  String get unknown => '未知错误 (-1)';

  @override
  String get no_internet => '无网络错误';

  @override
  String get timeout => '超时';

  @override
  String get loading_error => '请尝试重新加载';

  @override
  String search_result(String query) {
    return '$query 的搜索结果';
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

    return '$currentString件/$totalString件显示中';
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

    return '历史 $currentString/$maxString';
  }

  @override
  String get delete_all_queries => '是否删除所有历史?';
}
