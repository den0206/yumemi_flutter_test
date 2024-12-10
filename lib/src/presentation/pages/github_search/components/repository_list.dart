import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yumemi_flutter_test/src/core/extension/context.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/response.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_detail/github_detail_page.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/github_search_notifier.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/github_search_state.dart';

final class RepositoryList extends ConsumerWidget {
  const RepositoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(githubSearchNotifierProvider);

    // 検索結果なし
    if (state.repositories.isEmpty) {
      // 画面全体ローディング
      if (state.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return const Center(
        child: Text('Github のリポジトリを検索できます'),
      );
    }

    // リポジトリ一覧
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: state.itemCount,
      itemBuilder: (context, index) {
        // リポジトリのインデックスが範囲内であれば、リポジトリセルを返す
        if (index < state.repositories.length) {
          final repository = state.repositories[index];
          return _RepositoryCell(repository);
        }
        // それ以外の場合はローディングセルを返す
        return _LoadingCell(
          onVisibled: () async {
            if (!state.hasNextPage) return;

            try {
              //  動作: ページネーション機能
              await ref.read(githubSearchNotifierProvider.notifier).search();
            } catch (e) {
              debugPrint(e.toString());
            }
          },
        );
      },
    );
  }
}

final class _RepositoryCell extends StatelessWidget {
  const _RepositoryCell(
    this.repository,
  );

  final RepositorySchema repository;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(repository.fullName),
      subtitle: Text(repository.description ?? ''),
      onTap: () async {
        // 動作: リポジトリ詳細画面に遷移
        await context.pushNamed(
          GithubDetailPage.routeName,
          arguments: repository,
        );
      },
    );
  }
}

final class _LoadingCell extends StatelessWidget {
  const _LoadingCell({this.onVisibled});

  final Function()? onVisibled;
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('next_page'),
      child: const CircularProgressIndicator.adaptive(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          onVisibled?.call();
        }
      },
    );
  }
}
