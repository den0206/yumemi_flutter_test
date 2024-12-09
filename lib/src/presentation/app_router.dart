import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/response.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_detail/github_detail_page.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/github_search_page.dart';

part '../_generated/src/presentation/app_router.g.dart';

@Riverpod(keepAlive: true)
AppRouter appRouter(Ref ref) {
  return AppRouter();
}

// ルートを管理するクラス
final class AppRouter {
  AppRouter();

  // ルート(/)
  final initialRoute = GithubSearchPage.routeName;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case GithubSearchPage.routeName:
        // リポジトリ検索ページ
        return MaterialPageRoute(builder: (_) => const GithubSearchPage());
      case GithubDetailPage.routeName:
        // リポジトリ詳細ベージ
        return MaterialPageRoute(
          builder: (_) {
            final repo = settings.arguments! as RepositorySchema;
            return GithubDetailPage(
              repository: repo,
            );
          },
        );

      default:
        // ルートが見つからない場合,表示されるページ
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined')),
          ),
        );
    }
  }
}
