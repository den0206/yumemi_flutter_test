import 'package:flutter/material.dart';
import 'package:yumemi_flutter_test/src/core/extension/context.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/response.dart';
import 'package:yumemi_flutter_test/src/presentation/components/circle_image_avatar.dart';
import 'package:yumemi_flutter_test/src/presentation/components/github_label.dart';

final class GithubDetailPage extends StatelessWidget {
  const GithubDetailPage({required this.repository, super.key});

  static const routeName = '/detail';

  final RepositorySchema repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(repository.fullName),
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                CircleImageAvatar(
                  url: repository.owner.avatarUrl,
                  size: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  repository.fullName,
                  style: context.titleLarge,
                ),
                Visibility(
                  visible: repository.description?.isNotEmpty ?? false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: Text(
                      repository.description ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GithubLabels(repo: repository),
                const Divider(),
                // TODO ----READMEを取得して表示する
                const Text('README表示予定'),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
