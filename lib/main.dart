import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_test/src/presentation/app_router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // route 設定
    final router = ref.watch(appRouterProvider);

    return MaterialApp(
      title: 'Github Search App',
      initialRoute: router.initialRoute,
      onGenerateRoute: router.generateRoute,
    );
  }
}
