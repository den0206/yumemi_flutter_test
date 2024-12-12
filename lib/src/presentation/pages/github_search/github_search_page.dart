import 'package:flutter/material.dart';
import 'package:yumemi_flutter_test/src/core/extension/context.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/components/repository_list.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/components/search_app_bar.dart';

final class GithubSearchPage extends StatelessWidget {
  const GithubSearchPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 検索AppBar
          const SearchAppBar(),
          //リポジトリリスト
          const RepositoryList(),

          // 下部の余白
          SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox(
              height: context.paddingBottom,
            ),
          ),
        ],
      ),
    );
  }
}
