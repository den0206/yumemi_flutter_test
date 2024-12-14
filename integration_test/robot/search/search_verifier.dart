import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:yumemi_flutter_test/src/core/widget_key/common/dialog_key.dart';
import 'package:yumemi_flutter_test/src/core/widget_key/search/search_page_key.dart';
import 'package:yumemi_flutter_test/src/presentation/components/github_label.dart';

import '../../test_data/base_test_data.dart';
import '../base_robot.dart';

final class SearchVerifier implements BaseVerifier {
  SearchVerifier({required this.binding});

  @override
  final IntegrationTestWidgetsFlutterBinding binding;

  // 検証: 検索文言が存在するか
  void findQuery(BaseTestData testData) {
    expect(find.text(testData.testQuery), findsWidgets);
  }

  // 検証: リポジトリ名が存在するか
  void findTargetRepository(BaseTestData testData) {
    expect(find.text(testData.testRepositoryName), findsWidgets);
  }

  // 検証: セル内のコンテンツが存在するか
  void findCellContents() {
    expect(find.byType(ListTile), findsWidgets);
    expect(find.byKey(GithubLabelType.star.key), findsWidgets);
    expect(find.byKey(GithubLabelType.fork.key), findsWidgets);
    expect(find.byKey(GithubLabelType.openIssue.key), findsWidgets);
    expect(find.byKey(GithubLabelType.wathchers.key), findsWidgets);
  }

  // 検証: セル内のコンテンツが存在しないか
  void notFindCellContents() {
    expect(find.byType(ListTile), findsNothing);
    expect(find.byKey(GithubLabelType.star.key), findsNothing);
    expect(find.byKey(GithubLabelType.fork.key), findsNothing);
    expect(find.byKey(GithubLabelType.openIssue.key), findsNothing);
    expect(find.byKey(GithubLabelType.wathchers.key), findsNothing);
  }

  // 検証: エラーダイアログが存在するか
  void findErrorDialog() {
    expect(find.byKey(DialogKey.error), findsOneWidget);
  }

  // 検証: 検索履歴リストが存在するか
  // 単一の文字列が存在するか
  void findQueryHistory(BaseTestData testData) {
    expect(
      find.descendant(
        of: find.byKey(SearchPageKey.queryHistory),
        matching: find.text(testData.testQuery),
      ),
      findsOneWidget,
    );
  }

  // 検証: 検索履歴リストが存在しない
  // 単一の文字列が存在するか
  void notFindQueryHistory(BaseTestData testData) {
    expect(
      find.descendant(
        of: find.byKey(SearchPageKey.queryHistory),
        matching: find.text(testData.testQuery),
      ),
      findsNothing,
    );
  }
}
