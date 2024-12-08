import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/response.dart';
import 'package:yumemi_flutter_test/src/infrastructure/repository/github_repository.dart';

import '../../_generated/src/domain/annotations/repository.mocks.dart';
import '../../domain/entity/github/repository/search/mock_data.dart';

void main() {
  final mockClient = MockClient();
  final repository = GithubRepository(client: mockClient);

  group('/search/repositories', () {
    const mockSearchResponse = MockData.searchResponse;
    // 共通のセットアップメソッド
    Future<void> mockHttpResponse(int statusCode, String responseBody) async {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(
          responseBody,
          statusCode,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        ),
      );
    }

    test('正常系: モックデータ', () async {
      await mockHttpResponse(200, mockSearchResponse);

      final result = await repository.searchRepositories();

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

      final encoded = json.decode(mockSearchResponse);
      final convertData = SearchRepositoryResponse.fromJson(encoded);

      for (var i = 0; i < result.items.length; i++) {
        expect(result.items[i], convertData.items[i]);
      }
    });

    test('正常系: モックデータ(クラス変換)', () async {
      final encoded = json.decode(mockSearchResponse);
      final convertData = SearchRepositoryResponse.fromJson(encoded);

      await mockHttpResponse(200, mockSearchResponse);

      final result = await repository.searchRepositories();

      for (var i = 0; i < result.items.length; i++) {
        expect(result.items[i], convertData.items[i]);
      }
    });
  });
}
