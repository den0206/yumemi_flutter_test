import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_test/main.dart' as app;

import '../robot/search/search_operator.dart';
import '../robot/search/search_robot.dart';
import '../robot/search/search_verifier.dart';
import '../test_data/negative_test_data.dart';

void main() {
  final testData = NegativeTestData();

  testWidgets(
    '検索結果0件のシナリオ',
    (tester) async {
      final searchRobot = SearchRobot(
        operator: SearchOperator(tester: tester),
        verifier: SearchVerifier(),
        testData: testData,
      );

      app.main();

      await tester.pumpAndSettle();

      // 検索動作(0件)
      // エラーダイアログを表示
      await searchRobot.searchQueryNotFound();

      // ダイアログを閉じる
      await searchRobot.closeDialog();
    },
  );
}
