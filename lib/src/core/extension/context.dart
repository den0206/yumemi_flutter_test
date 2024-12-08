import 'package:flutter/material.dart';

extension FocusExtension on BuildContext {
  // キーボードを閉じる
  void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
