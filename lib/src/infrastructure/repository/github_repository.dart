import 'package:yumemi_flutter_test/src/domain/entity/github/repository/api_client.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/response.dart';

// 【Guthub API】 https://api.github.com/
class GithubRepository extends GithubApiClient {
  GithubRepository({required super.client});

  //【GET】search/repositories
  Future<SearchRepositoryResponse> searchRepositories() async {
    final uri = setUri(
      '/search/repositories',
    );

    return getRequest<SearchRepositoryResponse>(
      uri: uri,
      fromJsonT: SearchRepositoryResponse.fromJson,
    );
  }
}
