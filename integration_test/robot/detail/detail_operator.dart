import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_robot.dart';

final class DetailOperator implements BaseOperator {
  DetailOperator({required this.tester});

  @override
  final WidgetTester tester;

  //動作: AppBar BackButtonを押す
  Future<void> tabBackButton() async {
    final navigator = tester.state<NavigatorState>(find.byType(Navigator));
    navigator.pop();
    await tester.pumpAndSettle();
  }
}
