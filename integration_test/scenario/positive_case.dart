import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:yumemi_flutter_test/main.dart' as app;

import '../robot/detail/detail_operator.dart';
import '../robot/detail/detail_robot.dart';
import '../robot/detail/detail_verifier.dart';
import '../robot/search/search_operator.dart';
import '../robot/search/search_robot.dart';
import '../robot/search/search_verifier.dart';
import '../test_data/positive_test_data.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final testData = SearchTestData();
  const category = 'positive_case_test';

  testWidgets(
    '検索シナリオ',
    (tester) async {
      /// 各ページのロボットの準備

      // リポジトリ一覧画面
      final searchRobot = SearchRobot(
        operator: SearchOperator(tester: tester),
        verifier: SearchVerifier(binding: binding),
        testCategory: category,
        testData: testData,
      );

      // リポジトリ詳細画面
      final detailRobot = DetailRobot(
        operator: DetailOperator(tester: tester),
        verifier: DetailVerifier(binding: binding),
        testCategory: category,
        testData: testData,
      );

      app.main();

      // Androidでスクリーンショットを撮影するために必要
      await binding.convertFlutterSurfaceToImage();

      await tester.pumpAndSettle();

      // 検索動作
      await searchRobot.searchQuery();

      // リポジトリ選択動作
      // 詳細画面へ遷移
      await searchRobot.tapRepository();

      // 詳細画面検証
      await detailRobot.findElements();

      // 戻る動作
      await detailRobot.tabBackButton();
    },
  );
}
