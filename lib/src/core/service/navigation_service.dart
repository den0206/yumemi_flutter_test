import 'package:flutter/material.dart';

final class NavigationService {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
}
