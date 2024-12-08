import 'package:yumemi_flutter_test/src/domain/entity/github/repository/api_client.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/response.dart';

// 【Guthub API】 https://api.github.com/
final class GithubRepository extends GithubApiClient {
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
