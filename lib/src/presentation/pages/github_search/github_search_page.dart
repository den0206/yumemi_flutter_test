import 'package:flutter/material.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/components/search_app_bar.dart';

final class GithubSearchPage extends StatelessWidget {
  const GithubSearchPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SearchAppBar(),
      body: Center(
        child: Text('Github のリポジトリを検索できます'),
      ),
    );
  }
}
