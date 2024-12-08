import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/api_client.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/response.dart';

part '../../_generated/src/infrastructure/repository/github_repository.g.dart';

// アプリケーション内で使用するHttpClient
@riverpod
http.Client httpClient(Ref ref) {
  return http.Client();
}

// Presentation層から使用するGithubRepository
@riverpod
GithubRepository githubRepository(Ref ref) {
  return GithubRepository(client: ref.watch(httpClientProvider));
}

// 【Guthub API】 https://api.github.com/
class GithubRepository extends GithubApiClient {
  GithubRepository({required super.client});

  //【GET】search/repositories
  Future<SearchRepositoryResponse> searchRepositories({
    required String query,
  }) async {
    final uri = setUri('/search/repositories', {
      'q': query,
    });

    return getRequest<SearchRepositoryResponse>(
      uri: uri,
      fromJsonT: SearchRepositoryResponse.fromJson,
    );
  }
}
