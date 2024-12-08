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
    switch (code) {
      case codeNotModified:
        return '304 Not Modified';
      case codeValidationFailed:
        return '422 Validation Failed';
      case codeServiceUnavailable:
        return '503 Service unavailable';
      default:
        return 'Unknown Error';
    }
  }

  // エラーコードの定義
  static const codeNotModified = 'not-modified';
  static const codeValidationFailed = 'validation-failed';
  static const codeServiceUnavailable = 'service-unavailable';
  static const codeUnknown = 'unknown';

  /// エラーコード
  final String code;

  @override
  String toString() => message;
}
