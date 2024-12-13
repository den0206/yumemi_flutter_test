import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_test/src/core/extension/theme_mode.dart';
import 'package:yumemi_flutter_test/src/presentation/app_router.dart';
import 'package:yumemi_flutter_test/src/presentation/notifier/theme_mode_notifier.dart';

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

    // Theme 設定
    final theme = ref.watch(themeModeNotiferProvider);

    return MaterialApp(
      title: 'Github Search App',
      themeMode: theme,
      theme: theme.light,
      darkTheme: theme.dark,
      initialRoute: router.initialRoute,
      onGenerateRoute: router.generateRoute,
    );
  }
}
