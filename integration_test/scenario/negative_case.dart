import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:yumemi_flutter_test/main.dart' as app;

import '../robot/search/search_operator.dart';
import '../robot/search/search_robot.dart';
import '../robot/search/search_verifier.dart';
import '../test_data/negative_test_data.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final testData = NegativeTestData();
  const category = 'negative_case_test';

  testWidgets(
    '検索結果0件のシナリオ',
    (tester) async {
      final searchRobot = SearchRobot(
        operator: SearchOperator(tester: tester),
        verifier: SearchVerifier(binding: binding),
        testCategory: category,
        testData: testData,
      );

      app.main();

      // Androidでスクリーンショットを撮影するために必要
      await binding.convertFlutterSurfaceToImage();

      await tester.pumpAndSettle(const Duration(seconds: 3));

      // 検索動作(0件)
      // エラーダイアログを表示
      await searchRobot.searchQueryNotFound();

      // ダイアログを閉じる
      await searchRobot.closeDialog();

      // 検索履歴が表示しない
      await searchRobot.notFindQueryHistory();
    },
  );
}
