import 'package:flutter/material.dart';

// リポジトリ詳細画面用のKey
final class DetailPageKey {
  static const _prefix = 'detail_page';

  static const avatar = Key('${_prefix}_avatar_image');
  static const fullName = Key('${_prefix}_full_name');
  static const readme = Key('${_prefix}_readme');
  static const language = Key('${_prefix}_language');
}
