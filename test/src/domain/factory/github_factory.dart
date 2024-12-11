import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/query.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/response.dart';
import 'package:yumemi_flutter_test/src/domain/model/order_type.dart';
import 'package:yumemi_flutter_test/src/domain/model/sort_type.dart';

import 'base_factory.dart';

final class SearchRepositoryResponseFactory
    extends BaseFactory<SearchRepositoryResponse> {
  /// 単体のフェイクモデルの生成
  @override
  SearchRepositoryResponse generateFake() {
    final repositories = RepositoryFactory().generateFakeList();
    return SearchRepositoryResponse(
      totalCount: repositories.length + 1,
      items: repositories,
    );
  }

  /// 配列のフェイクモデルの作成
  @override
  List<SearchRepositoryResponse> generateFakeList({int? length}) {
    length ??= faker.randomGenerator.integer(10);
    return List.generate(length, (_) => generateFake());
  }
}

final class RepositoryFactory extends BaseFactory<RepositorySchema> {
  /// 単体のフェイクモデルの生成
  @override
  RepositorySchema generateFake() {
    return RepositorySchema(
      fullName: rString,
      owner: OwnerFactory().generateFake(),
      description: rWord,
      stargazersCount: rInteger,
      watchersCount: rInteger,
      openIssuesCount: rInteger,
      forksCount: rInteger,
      language: rWord,
      htmlUrl: rUrl,
    );
  }

  /// 配列のフェイクモデルの作成
  @override
  List<RepositorySchema> generateFakeList({int? length}) {
    length ??= faker.randomGenerator.integer(10);
    return List.generate(length, (_) => generateFake());
  }
}

final class OwnerFactory extends BaseFactory<OwnerSchema> {
  /// 単体のフェイクモデルの生成
  @override
  OwnerSchema generateFake() {
    return OwnerSchema(login: rName, avatarUrl: rUrl);
  }

  /// 配列のフェイクモデルの作成
  @override
  List<OwnerSchema> generateFakeList({int? length}) {
    length ??= faker.randomGenerator.integer(10);
    return List.generate(length, (_) => generateFake());
  }
}

final class SearchRepositoryQueryFactory
    extends BaseFactory<SearchRepositoryQuery> {
  /// 単体のフェイクモデルの生成
  @override
  SearchRepositoryQuery generateFake() {
    // null許容プロパティには,乱数を生成し1/2の確率でnullが与えられる
    return SearchRepositoryQuery(
      q: rName,
      page: rInteger.isOdd ? rInteger : null,
      sort: rInteger.isOdd ? rEnum(SortType.values) : null,
      order: rInteger.isOdd ? rEnum(OrderType.values) : null,
      perPage: rInteger.isOdd ? rInteger : null,
    );
  }

  /// 配列のフェイクモデルの作成
  @override
  List<SearchRepositoryQuery> generateFakeList({int? length}) {
    length ??= faker.randomGenerator.integer(10);
    return List.generate(length, (_) => generateFake());
  }
}
