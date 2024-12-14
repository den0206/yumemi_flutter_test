import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_test/src/_generated/src/l10n/app_localizations.dart';
import 'package:yumemi_flutter_test/src/core/extension/context.dart';
import 'package:yumemi_flutter_test/src/presentation/components/circle_icon_button.dart';
import 'package:yumemi_flutter_test/src/presentation/components/common_dialog.dart';
import 'package:yumemi_flutter_test/src/presentation/notifier/theme_mode_notifier.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/components/condition_search_panel.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/github_search_notifier.dart';

final class SearchAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositories = ref.watch(
      githubSearchNotifierProvider.select((state) => state.repositories),
    );
    return SliverAppBar(
      title: _SearchTextField(
        // インクリメント検索の待機時間
        incrementalDuration: const Duration(seconds: 1),
        onSubmitted: (query) async {
          try {
            // キーボード上の検索ボタン: タップ時
            await ref.read(githubSearchNotifierProvider.notifier).search();
          } catch (e) {
            // エラーメッセージ表示
            if (context.mounted) await showError(context, e);
          }
        },
        onDeleted: () {
          // 削除ボタン: タップ時
          ref.read(githubSearchNotifierProvider.notifier).clear();
        },
        onChanged: (query) async {
          // 検索文字列変更時
          ref.read(githubSearchNotifierProvider.notifier).onQueryChanged(query);

          try {
            // インクリメント検索
            await ref.read(githubSearchNotifierProvider.notifier).search();
          } catch (e) {
            // エラーメッセージ表示
            if (context.mounted) await showError(context, e);
          }
        },
      ),
      actions: const [
        // テーマモード変更Switch
        _ThemeSwitch(),
        // 条件検索パネル表示ボタン
        _ConditionSearchButton(),
      ],
      floating: true,
      pinned: true,
      // 現在の取得数/合計数
      bottom: repositories.isEmpty ? null : _TotalCountText(),
    );
  }
}

// 検索Field
final class _SearchTextField extends ConsumerStatefulWidget {
  const _SearchTextField({
    this.onChanged,
    this.onSubmitted,
    this.onDeleted,
    this.incrementalDuration,
  });

  /// 検索ボタンタップ時ののイベント
  final Function(String)? onChanged;

  /// 検索ボタンタップ時ののイベント
  final Function(String)? onSubmitted;

  /// 削除ボタンタップ時ののイベント
  final GestureTapCallback? onDeleted;

  // インクリメント検索の待機時間
  final Duration? incrementalDuration;

  @override
  ConsumerState<_SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends ConsumerState<_SearchTextField> {
  final _controller = TextEditingController();
  String _incrementalText = '';
  Timer? _debounce;

  OutlineInputBorder get border => OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(25),
      );

  @override
  void initState() {
    super.initState();

    final query =
        ref.read(githubSearchNotifierProvider.select((state) => state.query));
    _controller.text = query;
    _incrementalText = query;
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        // 多言語: リポジトリ検索
        hintText: L10n.of(context).search_repository,
        contentPadding: const EdgeInsets.all(10),
        prefixIcon: Icon(Icons.search, color: IconTheme.of(context).color),
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: _controller,
          builder: (_, value, __) {
            // 1文字以上入力されている場合は削除アイコンを表示する
            return Visibility(
              visible: value.text.isNotEmpty,
              child: InkWell(
                onTap: () async {
                  // 検索文字列をクリアする
                  _controller.clear();

                  widget.onDeleted?.call();
                },
                child: Icon(
                  Icons.close,
                  color: IconTheme.of(context).color,
                ),
              ),
            );
          },
        ),
        fillColor: Colors.grey.withValues(alpha: 0.25),
        filled: true,
        focusedBorder: border,
        enabledBorder: border,
        disabledBorder: border,
        counterText: '',
      ),
      // アルファベットのみ入力可能にする
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
      ],
      // 最大記入文字数
      maxLength: 15,
      keyboardType: TextInputType.text,
      onTapOutside: (event) {
        context.dismissKeyboard();
      },
      onChanged: (q) {
        if (q.isEmpty) {
          // 空文字であれば検索結果をクリアするために実行
          _incrementalText = '';
          widget.onDeleted?.call();
          return;
        }

        // バックスペースであれば処理終了
        if (_incrementalText.contains(q)) {
          _incrementalText = q;
          return;
        }

        if (_debounce?.isActive ?? false) _debounce!.cancel();
        _debounce = Timer(widget.incrementalDuration!, () {
          context.dismissKeyboard();

          // 検索を開始したら現在の検索結果をクリアする
          widget.onDeleted?.call();

          // ここで検索処理を実行
          widget.onChanged?.call(q);
          _incrementalText = q;
          // 実際の検索処理をここに追加
        });
      },
      // キーボードのEnterキー押下時に検索を実行する
      onSubmitted: (q) {
        context.dismissKeyboard();
        widget.onSubmitted?.call(q);
      },
      // キーボードのEnterキーを検索ボタンにする
      textInputAction: TextInputAction.search,
    );
  }
}

// 条件検索パネル表示ボタン
final class _ConditionSearchButton extends StatelessWidget {
  const _ConditionSearchButton();

  @override
  Widget build(BuildContext context) {
    return CircleIconButton(
      icon: const Icon(Icons.sort),
      onPressed: () async {
        context.dismissKeyboard();

        // 条件検索パネル 表示
        await showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return const ConditionSearchPanel();
          },
        );
      },
    );
  }
}

// テーマモード変更Switch
// Onはダークモード
final class _ThemeSwitch extends ConsumerWidget {
  const _ThemeSwitch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModeNotiferProvider);
    return Switch.adaptive(
      activeColor: Theme.of(context).colorScheme.primary,
      value: theme == ThemeMode.dark,
      onChanged: (value) async {
        final themeMode = value ? ThemeMode.dark : ThemeMode.light;

        // テーマモード切り替え
        await ref
            .read(themeModeNotiferProvider.notifier)
            .setThemeMode(themeMode);
      },
    );
  }
}

// 検索結果数
// 現在の取得数/合計数
final class _TotalCountText extends ConsumerWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(githubSearchNotifierProvider);
    return state.repositories.isEmpty
        ? Container()
        : ListTile(
            // 多言語: {検索文言} の検索結果
            leading: Text(
              L10n.of(context).search_result(state.query),
              style: context.titleSmall,
            ),
            //多言語: {現在の取得数}件/{合計数}件表示中
            trailing: Text(
              L10n.of(context)
                  .search_length(state.repositories.length, state.totalCount),
            ),
          );
  }
}
