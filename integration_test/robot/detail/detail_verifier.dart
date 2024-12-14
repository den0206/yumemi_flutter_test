import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_test/src/core/widget_key/detail/detail_page_key.dart';
import 'package:yumemi_flutter_test/src/presentation/components/github_label.dart';

import '../base_robot.dart';

final class DetailVerifier implements BaseVerifier {
  void findElements() {
    _findAvatarArea();
    _findFullNameArea();
    _findReadmeArea();

    _findStarLabel();
    _findForkLabel();
    _findOpenIssueLabel();
    _findWatchersLabel();
  }

  // 検証: ユーザー画像を表示するエリアが存在するか
  void _findAvatarArea() {
    expect(find.byKey(DetailPageKey.avatar), findsOneWidget);
  }

  // 検証: リポジトリ名を表示するエリアが存在するか
  void _findFullNameArea() {
    expect(find.byKey(DetailPageKey.fullName), findsOneWidget);
  }

  // 検証: README エリアが存在するか
  void _findReadmeArea() {
    expect(find.byKey(DetailPageKey.readme), findsOneWidget);
  }

  // 検証: Starラベルが一つ存在するか
  void _findStarLabel() {
    expect(find.byKey(GithubLabelType.star.key), findsOneWidget);
  }

  // 検証: Forkラベルが一つ存在するか
  void _findForkLabel() {
    expect(find.byKey(GithubLabelType.fork.key), findsOneWidget);
  }

  // 検証: OpenIssueラベルが一つ存在するか
  void _findOpenIssueLabel() {
    expect(find.byKey(GithubLabelType.openIssue.key), findsOneWidget);
  }

  // 検証: Watchersラベルが一つ存在するか
  void _findWatchersLabel() {
    expect(find.byKey(GithubLabelType.wathchers.key), findsOneWidget);
  }
}
