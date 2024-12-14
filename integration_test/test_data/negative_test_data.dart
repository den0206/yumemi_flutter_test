import 'base_test_data.dart';

final class NegativeTestData implements BaseTestData {
  // 検索結果が見つからない検索文言(0件)
  @override
  String get testQuery => 'bbvvbbbbvfd';

  @override
  String get testRepositoryName => '';
}
