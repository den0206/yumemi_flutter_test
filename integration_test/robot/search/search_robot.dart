import '../../test_data/base_test_data.dart';
import '../base_robot.dart';
import 'search_operator.dart';
import 'search_verifier.dart';

final class SearchRobot implements BaseRobot {
  SearchRobot({
    required this.operator,
    required this.verifier,
    required this.testData,
    required this.testCategory,
  });

  @override
  final SearchOperator operator;

  @override
  final SearchVerifier verifier;

  @override
  final BaseTestData testData;

  @override
  final String testCategory;

  Future<void> searchQuery() async {
    // 動作
    await operator.entryTextCorrectQuery(testData);

    // 検証
    verifier.findQuery(testData);
    verifier.findTargetRepository(testData);
    verifier.findCellContents();

    // スクリーンショット
    await takeScreenShot('input_query');
  }

  Future<void> searchQueryNotFound() async {
    // 動作
    await operator.entryTextCorrectQuery(testData);

    // 検証
    verifier.notFindCellContents();
    verifier.findErrorDialog();

    // スクリーンショット
    await takeScreenShot('not_found_repository');
  }

  Future<void> tapRepository() async {
    //動作
    await operator.tapRepository(testData);
  }

  Future<void> closeDialog() async {
    // 動作
    await operator.closeDialog();
  }
}
