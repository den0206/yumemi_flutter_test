import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/exception/network_exception.dart';

abstract class GithubApiClient {
  GithubApiClient({required this.client});

  final http.Client client;

  final String host = 'api.github.com';

  // タイムアウト時間
  final Duration _timeout = const Duration(seconds: 10);

  // リクエストヘッダ
  final Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/vnd.github+json',
    'X-GitHub-Api-Version': '2022-11-28',
  };

  Uri setUri(String path, [Map<String, dynamic>? query]) {
    return Uri.https(host, path, query);
  }

  // PAT付与
  Future<void> _setToken() async {
    await dotenv.load();

    final token = dotenv.env['GITHUB_TOKEN'];

    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
  }

  T _filterResponse<T>(
    http.Response response,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    try {
      // ステータスコードのチェック
      _checkStatusCode(response.statusCode);

      // RawDataの場合はStringを返す
      if (T == String) {
        return response.body as T;
      }

      // レスポンスの変換
      final handler = _GithubResponseBase<T>.fromResponse(response, fromJsonT);

      if (handler.data == null) {
        throw NetworkException.unknown();
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
      case 304:
        throw NetworkException.notModified();
      case 422:
        throw NetworkException.validationFailed();
      case 503:
        throw NetworkException.serviceUnavailable();
      default:
        throw NetworkException.unknown();
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
      await _setToken();
      final res = await client.get(uri, headers: headers).timeout(_timeout);

      return _filterResponse<T>(res, fromJsonT);
    } on SocketException catch (_) {
      // ネットワーク接続エラー
      throw NetworkException.noInternetConnection();
    } on TimeoutException {
      // タイムアウトエラー
      throw NetworkException.timeout();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getRawRequest<String>({required Uri uri}) async {
    try {
      await _setToken();
      headers['Accept'] = 'application/vnd.github.raw+json';

      final res = await client.get(uri, headers: headers).timeout(_timeout);

      return _filterResponse<String>(
        res,
        (json) => json['content'],
      );
    } on SocketException catch (_) {
      // ネットワーク接続エラー
      throw NetworkException.noInternetConnection();
    } on TimeoutException {
      // タイムアウトエラー
      throw NetworkException.timeout();
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
