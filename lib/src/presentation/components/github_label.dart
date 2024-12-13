import 'package:flutter/material.dart';
import 'package:yumemi_flutter_test/src/core/extension/context.dart';
import 'package:yumemi_flutter_test/src/core/extension/integer.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/response.dart';

enum GithubLabelType {
  star,
  fork,
  openIssue,
  wathchers;

  // アイコン
  IconData get icon {
    switch (this) {
      case GithubLabelType.star:
        return Icons.star;
      case GithubLabelType.fork:
        return Icons.fork_left;
      case GithubLabelType.openIssue:
        return Icons.bug_report;
      case GithubLabelType.wathchers:
        return Icons.visibility;
    }
  }

  int getValue(RepositorySchema repo) {
    switch (this) {
      case GithubLabelType.star:
        return repo.stargazersCount;
      case GithubLabelType.fork:
        return repo.forksCount;
      case GithubLabelType.openIssue:
        return repo.openIssuesCount;
      case GithubLabelType.wathchers:
        return repo.watchersCount;
    }
  }
}

// リポジトリ一覧画面、詳細画面で使用予定の為、共通コンポーネント
final class GithubLabels extends StatelessWidget {
  const GithubLabels({required this.repo, super.key});

  final RepositorySchema repo;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 3,
      children: GithubLabelType.values
          .map((e) => _GithubLabel(repo: repo, type: e))
          .toList(),
    );
  }
}

final class _GithubLabel extends StatelessWidget {
  const _GithubLabel({required this.repo, required this.type});

  final RepositorySchema repo;
  final GithubLabelType type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(type.icon),
        Text(
          type.getValue(repo).displayNumber,
          style: context.bodySmall,
        ),
      ],
    );
  }
}
