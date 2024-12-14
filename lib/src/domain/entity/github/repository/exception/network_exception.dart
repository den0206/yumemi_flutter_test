import 'package:yumemi_flutter_test/src/_generated/src/l10n/app_localizations.dart';
import 'package:yumemi_flutter_test/src/core/service/navigation_service.dart';
import 'package:yumemi_flutter_test/src/domain/entity/exception/custom_exception.dart';

final class NetworkException extends CustomException {
  // (304) Not Modified
  factory NetworkException.notModified() => const NetworkException._(
        codeNotModified,
      );

  // (422) Validation Failed
  factory NetworkException.validationFailed() => const NetworkException._(
        codeValidationFailed,
      );

  // (503) Service unavailable
  factory NetworkException.serviceUnavailable() => const NetworkException._(
        codeServiceUnavailable,
      );

  // ネットワークエラー
  factory NetworkException.noInternetConnection() => const NetworkException._(
        codeNoInternetConnection,
      );

  // タイムアウトエラー
  factory NetworkException.timeout() => const NetworkException._(
        codeTimeout,
      );

  // リポジトリ検索結果0件
  // エラーでは無いが、NetworkExceptionとして定義します
  factory NetworkException.notFoundRepository() => const NetworkException._(
        codeNotFoundRepository,
      );

  /// 不明なエラー
  factory NetworkException.unknown() => const NetworkException._(
        codeUnknown,
      );

  const NetworkException._([
    String? code,
  ]) : code = code ?? codeUnknown;

  // エラーダイアログに表示する文言
  @override
  String get message {
    final l10n = L10n.of(NavigationService.context);

    // 多言語: ネットワークエラーメッセージ
    switch (code) {
      case codeNotModified:
        return l10n.not_modified;
      case codeValidationFailed:
        return l10n.validation_failed;
      case codeServiceUnavailable:
        return l10n.service_unavailable;
      case codeNoInternetConnection:
        return l10n.no_internet;
      case codeTimeout:
        return l10n.timeout;
      case codeNotFoundRepository:
        return l10n.no_search_result;
      default:
        return l10n.unknown;
    }
  }

  // エラーコードの定義
  static const codeNotModified = 'not-modified';
  static const codeValidationFailed = 'validation-failed';
  static const codeServiceUnavailable = 'service-unavailable';
  static const codeNoInternetConnection = 'no-internet-connection';
  static const codeTimeout = 'timeout';
  static const codeNotFoundRepository = 'not-found-repository';
  static const codeUnknown = 'unknown';

  /// エラーコード
  final String code;

  @override
  String toString() => message;
}
