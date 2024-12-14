import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../_generated/src/domain/model/language.g.dart';

@riverpod
Languages language(Ref ref) {
  // アプリ言語はOSの言語から取得
  // アプリ内更新不可
  return Languages.getLanguage(Platform.localeName);
}

// アプリ内対応言語 列挙体
// 現在は3言語
// OSシステム言語が一致しない場合は,英語を使用
enum Languages {
  // 英語
  en,
  // 日本語
  ja,
  // 中国語
  zh;

  static List<Locale> get supportedlanguage =>
      Languages.values.map((l) => l.locale).toList();

  static Languages getLanguage(String value) {
    final parts = value.split('_')[0];
    final lang = Languages.values.firstWhereOrNull((l) => l.name == parts);

    // 対応している言語に一致しなかった場合は,英語を返却
    return lang ?? Languages.en;
  }

  Locale get locale {
    return Locale(name);
  }
}
