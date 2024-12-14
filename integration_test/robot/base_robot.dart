import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test_data/base_test_data.dart';

// テストシナリオから呼ばれるロボットクラス
abstract interface class BaseRobot {
  /// アプリの操作を行うクラス
  BaseOperator get operator;

  /// アプリの検証を行うクラス
  BaseVerifier get verifier;

  /// テストデータを指定するクラス
  BaseTestData get testData;

  /// テストの種別(スクリーンショットの撮影に使用)
  String get testCategory;
}

extension BaseRobotExt on BaseRobot {
  /// スクリーンショットを撮る関数
  Future<void> takeScreenShot(String name) async {
    await verifier.binding.takeScreenshot(
      '<$testCategory>_$name',
    );
  }
}

/// アプリの操作を行う抽象クラス
abstract interface class BaseOperator {
  WidgetTester get tester;
}

/// アプリの操作を行う抽象クラス
abstract interface class BaseVerifier {
  // スクリーンショットを撮影するために必要
  IntegrationTestWidgetsFlutterBinding get binding;
}
