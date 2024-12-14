import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_test/main.dart' as app;

import '../robot/search/search_operator.dart';
import '../robot/search/search_robot.dart';
import '../robot/search/search_verifier.dart';
import '../test_data/search_test_data.dart';

void main() {
  final testData = SearchTestData();

  testWidgets(
    '検索シナリオ',
    (tester) async {
      /// 各ページのロボットの準備

      // リポジトリ一覧画面
      final searchRobot = SearchRobot(
        operator: SearchOperator(tester: tester),
        verifier: SearchVerifier(),
        testData: testData,
      );

      app.main();

      await tester.pumpAndSettle();

      // 検索動作
      await searchRobot.searchQuery();

      // リポジトリ選択動作
      // 詳細画面へ遷移
      await searchRobot.tapRepository();
    },
  );
}
