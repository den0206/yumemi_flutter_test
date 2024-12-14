import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_test/src/core/widget_key/common/dialog_key.dart';
import 'package:yumemi_flutter_test/src/core/widget_key/search/search_page_key.dart';

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
      find.byKey(SearchPageKey.searchTextField),
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

  // 動作: ダイアログを閉じる
  Future<void> closeDialog() async {
    final closeDialogButton = find.descendant(
      of: find.byKey(DialogKey.error),
      matching: find.byKey(DialogKey.cancel),
    );

    await tester.tap(closeDialogButton);
    await tester.pumpAndSettle();
  }

  // 動作: 検索文言をクリア
  Future<void> tapClearButton() async {
    final clearButton = find.descendant(
      of: find.byKey(SearchPageKey.searchTextField),
      matching: find.byIcon(Icons.close),
    );
    await tester.tap(clearButton);
    await tester.pumpAndSettle();
  }
}
