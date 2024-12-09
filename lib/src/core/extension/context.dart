import 'package:flutter/material.dart';

extension FocusExtension on BuildContext {
  // キーボードを閉じる
  void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

extension RouteExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) =>
      navigator.pushNamed(routeName, arguments: arguments);

  void pop<T extends Object?>([T? result]) => navigator.pop(result);
}
