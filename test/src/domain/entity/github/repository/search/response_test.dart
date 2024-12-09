import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/response.dart';

import '../../../../factory/github_factory.dart';
import 'mock_data.dart';

void main() {
  group('/search/repositories モック変換テスト', () {
    final mockData = json.decode(MockData.searchResponse);
    test('fromJson', () {
      final result = SearchRepositoryResponse.fromJson(mockData);

      expect(result.totalCount, 83181);
      expect(result.items.length, 30);

      final item = result.items.first;

      // 文字列変換が正常か
      expect(item.fullName, 'openai/openai-cookbook');
      expect(item.description, 'Examples and guides for using the OpenAI API');
      expect(item.language, 'MDX');
      expect(item.htmlUrl, 'https://github.com/openai/openai-cookbook');

      // 数値変換が正常か
      expect(item.stargazersCount, 60510);
      expect(item.watchersCount, 60510);
      expect(item.forksCount, 9627);
      expect(item.openIssuesCount, 61);

      // ネストされたObject の変換が正常か
      const owner = OwnerSchema(
        login: 'openai',
        avatarUrl: 'https://avatars.githubusercontent.com/u/14957082?v=4',
      );

      expect(item.owner, owner);
    });
  });

  group('/search/repositories フェイクモデル変換テスト', () {
    test('SearchRepository', () {
      final fact = SearchRepositoryResponseFactory();
      final data = fact.generateFake();

      final json = data.toJson();
      final decodedData = SearchRepositoryResponse.fromJson(json);

      expect(decodedData, data);
    });

    test('Repository', () {
      final fact = RepositoryFactory();
      final data = fact.generateFake();

      final json = data.toJson();
      final decodedData = RepositorySchema.fromJson(json);

      expect(decodedData, data);
    });

    test('Owner', () {
      final fact = OwnerFactory();
      final data = fact.generateFake();

      final json = data.toJson();
      final decodedData = OwnerSchema.fromJson(json);

      expect(decodedData, data);
    });
  });
}
