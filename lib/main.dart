import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_test/src/_generated/src/l10n/app_localizations.dart';
import 'package:yumemi_flutter_test/src/core/extension/theme_mode.dart';
import 'package:yumemi_flutter_test/src/domain/model/language.dart';
import 'package:yumemi_flutter_test/src/infrastructure/local_data_source/account_local_data_source.dart';
import 'package:yumemi_flutter_test/src/presentation/app_router.dart';
import 'package:yumemi_flutter_test/src/presentation/notifier/theme_mode_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ローカルのに保存されているThemeMode を取得
  final themeMode = await AccountLocalDataSource().loadThemeMode();
  runApp(
    ProviderScope(
      overrides: [
        // ThemeMode を上書き
        themeModeNotiferProvider
            .overrideWith(() => ThemeModeNotifier(themeMode)),
      ],
      child: const MyApp(),
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

    // language 設定
    final language = ref.watch(languageProvider);

    return MaterialApp(
      title: 'Github Search App',
      themeMode: theme,
      theme: theme.light,
      darkTheme: theme.dark,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: Languages.supportedlanguage,
      locale: language.locale,
      initialRoute: router.initialRoute,
      onGenerateRoute: router.generateRoute,
    );
  }
}
