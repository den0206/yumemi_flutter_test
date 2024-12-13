import 'package:flutter/material.dart';

extension FocusExtension on BuildContext {
  // キーボードを閉じる
  void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

// Navigator 拡張
extension RouteExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) =>
      navigator.pushNamed(routeName, arguments: arguments);

  void pop<T extends Object?>([T? result]) => navigator.pop(result);
}

// TextTheme 拡張
extension TextStyleExtension on BuildContext {
  TextStyle get titleLarge {
    return Theme.of(this).textTheme.titleLarge!;
  }

  TextStyle get titleSmall {
    return Theme.of(this).textTheme.titleSmall!;
  }

  TextStyle get bodySmall {
    return Theme.of(this).textTheme.bodySmall!;
  }
}

// Size 拡張
extension SizedContext on BuildContext {
  ///  MediaQuery.of(context)
  MediaQueryData get mq => MediaQuery.of(this);

  /// Returns if Orientation is landscape
  bool get isLandscape => mq.orientation == Orientation.landscape;

  ///  MediaQuery.of(context).size
  Size get sizePx => mq.size;

  ///  MediaQuery.of(context).size.width
  double get widthPx => sizePx.width;

  /// MediaQuery.of(context).height
  double get heightPx => sizePx.height;

  double get paddingBottom => mq.padding.bottom;

  double get paddingTop => mq.padding.top;

  /// % of screen width
  double widthPct(double fraction) => fraction * widthPx;

  /// % of screen height
  double heightPct(double fraction) => fraction * heightPx;
}
