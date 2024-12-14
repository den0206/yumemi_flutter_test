import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_test/src/core/extension/context.dart';
import 'package:yumemi_flutter_test/src/core/widget_key/detail/detail_page_key.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/response.dart';
import 'package:yumemi_flutter_test/src/infrastructure/repository/github_repository.dart';
import 'package:yumemi_flutter_test/src/presentation/components/circle_image_avatar.dart';
import 'package:yumemi_flutter_test/src/presentation/components/common_error_widget.dart';
import 'package:yumemi_flutter_test/src/presentation/components/common_loading_widget.dart';
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
                  key: DetailPageKey.avatar,
                  url: repository.owner.avatarUrl,
                  size: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  key: DetailPageKey.fullName,
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

                // README 表示
                _ReadmeArea(repository),

                // 下部余白
                SizedBox(
                  height: context.paddingBottom,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

final class _ReadmeArea extends ConsumerWidget {
  const _ReadmeArea(this.repository);
  final RepositorySchema repository;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchRepo = ref.watch(githubRepositoryProvider);
    return FutureBuilder<String>(
      // ignore: discarded_futures
      future: searchRepo.getReadme(repository),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const CommonErrorWidget();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MarkdownBody(
            key: DetailPageKey.readme,
            onTapLink: (_, href, __) {
              if (href != null) {
                debugPrint(href);
              }
            },
            selectable: true,
            data: snapshot.data ?? '',
            imageBuilder: (uri, _, __) => Image.network(
              uri.toString(),
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox.shrink();
              },
            ),
          );
        }

        return const CommonLoadingWidget();
      },
    );
  }
}
