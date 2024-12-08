import 'package:flutter/material.dart';

class GithubSearchPage extends StatelessWidget {
  const GithubSearchPage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Search'),
      ),
      body: const Center(
        child: Text('Github のリポジトリを検索できます'),
      ),
    );
  }
}
