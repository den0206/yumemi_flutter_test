import '../../test_data/base_test_data.dart';
import '../base_robot.dart';
import 'detail_operator.dart';
import 'detail_verifier.dart';

final class DetailRobot implements BaseRobot {
  DetailRobot({
    required this.operator,
    required this.verifier,
    required this.testData,
  });

  @override
  final DetailOperator operator;

  @override
  final DetailVerifier verifier;

  @override
  final BaseTestData testData;

  Future<void> findElements() async {
    // 検証
    verifier.findElements();
  }

  Future<void> tabBackButton() async {
    // 動作
    await operator.tabBackButton();
  }
}
