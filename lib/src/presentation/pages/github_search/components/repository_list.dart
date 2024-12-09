import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/github_search_notifier.dart';

final class RepositoryList extends ConsumerWidget {
  const RepositoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(githubSearchNotifierProvider);

    // ローディング中
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // 検索結果なし
    if (state.repositories.isEmpty) {
      return const Center(
        child: Text('Github のリポジトリを検索できます'),
      );
    }

    // リポジトリ一覧
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: state.repositories.length,
      itemBuilder: (context, index) {
        final repository = state.repositories[index];
        return ListTile(
          title: Text(repository.fullName),
        );
      },
    );
  }
}
