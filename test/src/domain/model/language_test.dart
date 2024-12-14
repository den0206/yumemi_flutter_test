import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_test/src/domain/model/language.dart';

void main() {
  group(
    'Lanuguage 変換テスト',
    () {
      // 渡される値
      final args = [
        'en',
        'en_US',
        'en_GB',
        'ja',
        'ja_JP',
        'zh',
        'zh_Hans',
        'zh_Hant',
        'fr',
        'fr_CA',
        'es',
        'es_MX',
        'pt',
        'pt_BR',
        'ru',
        'de',
        'it',
        'nl',
        'tr',
        'th',
        'id',
        'ar',
        'fa',
        'he',
        'sv',
        'da',
        'el',
        'cs',
      ];

      for (final arg in args) {
        if (arg.contains('en')) {
          test('英語変換($arg)', () {
            final result = Languages.getLanguage(arg);
            expect(result, Languages.en);
          });
        } else if (arg.contains('ja')) {
          test('日本語変換($arg)', () {
            final result = Languages.getLanguage(arg);
            expect(result, Languages.ja);
          });
        } else if (arg.contains('zh')) {
          test('中国語変換($arg)', () {
            final result = Languages.getLanguage(arg);
            expect(result, Languages.zh);
          });
        } else {
          test('該当言語以外($arg)', () {
            final result = Languages.getLanguage(arg);
            expect(result, Languages.en);
          });
        }
      }
    },
  );

  group('Lanuguage プロパティテスト', () {
    test('supportedlanguage', () {
      final result = Languages.supportedlanguage;
      expect(result.length, 3);
    });

    test('locale', () {
      final result = Languages.en.locale;
      expect(result, const Locale('en'));

      final result2 = Languages.ja.locale;
      expect(result2, const Locale('ja'));

      final result3 = Languages.zh.locale;
      expect(result3, const Locale('zh'));
    });
  });
}
