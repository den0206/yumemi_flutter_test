import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_data/base_test_data.dart';
import '../base_robot.dart';

final class SearchOperator implements BaseOperator {
  SearchOperator({required this.tester});

  @override
  final WidgetTester tester;

  /// 動作: 正しい検索文言の入力
  /// インクリメンタル検索
  Future<void> entryTextCorrectQuery(BaseTestData testData) async {
    // 検索フォームへのText入力
    await tester.enterText(
      find.byType(TextField).at(0),
      testData.testQuery,
    );
    await tester.pumpAndSettle();

    // インクリメンタル検索の実行の為,3秒待機
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
  }

  // 動作: リポジトリCellをタップ
  Future<void> tapRepository(BaseTestData testData) async {
    final targetCell = find.text(testData.testRepositoryName).at(0);
    await tester.tap(targetCell);
    await tester.pumpAndSettle();
  }
}
