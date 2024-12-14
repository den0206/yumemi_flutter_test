import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_test/src/presentation/components/github_label.dart';

import '../../test_data/base_test_data.dart';
import '../base_robot.dart';

class SearchVerifier implements BaseVerifier {
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
}
