abstract interface class BaseTestData {
  // 統合テスト用の検索文言
  String get testQuery;

  // 統合テスト用の表示することが想定されるリポジトリ名
  String get testRepositoryName;
}
