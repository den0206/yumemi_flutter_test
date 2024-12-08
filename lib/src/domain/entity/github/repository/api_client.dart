import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class GithubApiClient {
  GithubApiClient({required this.client});

  final http.Client client;

  final String host = 'api.github.com';

  // タイムアウト時間
  final Duration _timeout = const Duration(seconds: 10);

  // リクエストヘッダ
  Map<String, String> get headers => {
        'Content-type': 'application/json',
        'Accept': 'application/vnd.github+json',
        'X-GitHub-Api-Version': '2022-11-28',
      };

  Uri setUri(String path, [Map<String, dynamic>? query]) {
    return Uri.https(host, path, query);
  }

  T _filterResponse<T>(
    http.Response response,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    try {
      // ステータスコードのチェック
      _checkStatusCode(response.statusCode);

      // レスポンスの変換
      final handler = _GithubResponseBase<T>.fromResponse(response, fromJsonT);

      if (handler.data == null) {
        // TODO ---- エラー処理を実装する
        throw Exception('no data');
      }

      return handler.data!;
    } catch (e) {
      rethrow;
    }
  }

  void _checkStatusCode(
    int statusCode,
  ) {
    // ステータスコードに応じた例外処理
    switch (statusCode) {
      case 200:
        break;

      default:
        // TODO ---- エラー処理を実装する
        throw Exception('Network Error');
    }
  }
}

// 今回はGET Method のみ実装
// 基本的なCRUD 操作は当拡張で実装

extension APIBaseCrud on GithubApiClient {
  Future<T> getRequest<T>({
    required Uri uri,
    required T Function(Map<String, dynamic>) fromJsonT,
  }) async {
    try {
      final res = await client.get(uri, headers: headers).timeout(_timeout);

      return _filterResponse<T>(res, fromJsonT);
    } catch (e) {
      rethrow;
    }
  }
}

final class _GithubResponseBase<T> {
  _GithubResponseBase({
    required this.data,
    required this.statusCode,
  });

  factory _GithubResponseBase.fromResponse(
    http.Response response,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    final resJson = json.decode(utf8.decode(response.bodyBytes));

    return _GithubResponseBase(
      statusCode: response.statusCode,
      data: resJson != null ? fromJsonT(resJson) : null,
    );
  }
  final int statusCode;
  final T? data;
}
