import 'package:flutter/material.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/response.dart';

class GithubDetailPage extends StatelessWidget {
  const GithubDetailPage({required this.repository, super.key});

  static const routeName = '/detail';

  final RepositorySchema repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(repository.fullName),
      ),
      body: Center(
        child: Column(
          children: [
            Text(repository.fullName),
            Text(repository.description ?? ''),
            Text('stars: ${repository.stargazersCount}'),
            Text('watchers: ${repository.watchersCount}'),
            Text('issues: ${repository.openIssuesCount}'),
            Text('forks: ${repository.forksCount}'),
            Text('language: ${repository.language}'),
          ],
        ),
      ),
    );
  }
}
