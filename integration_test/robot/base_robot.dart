import 'package:flutter_test/flutter_test.dart';

import '../test_data/base_test_data.dart';

// テストシナリオから呼ばれるロボットクラス
abstract interface class BaseRobot {
  /// アプリの操作を行うクラス
  BaseOperator get operator;

  /// アプリの検証を行うクラス
  BaseVerifier get verifier;

  /// テストデータを指定するクラス
  BaseTestData get testData;
}

/// アプリの操作を行う抽象クラス
abstract interface class BaseOperator {
  WidgetTester get tester;
}

/// アプリの操作を行う抽象クラス
abstract interface class BaseVerifier {}
