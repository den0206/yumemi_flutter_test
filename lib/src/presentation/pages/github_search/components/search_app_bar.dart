import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_test/src/core/extension/context.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/github_search_notifier.dart';

final class SearchAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(githubSearchNotifierProvider);

    return AppBar(
      title: _SearchTextField(
        onSubmitted: (query) async {
          // キーボード上の検索ボタン: タップ時
          await ref.read(githubSearchNotifierProvider.notifier).search();
        },
        onDeleted: () {
          // 削除ボタン: タップ時
          ref.read(githubSearchNotifierProvider.notifier).clear();
        },
        onChanged: (query) {
          // 検索文字列変更時
          ref.read(githubSearchNotifierProvider.notifier).onQueryChanged(query);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () async {
            // 検索ボタン(アイコン): タップ時
            await ref.read(githubSearchNotifierProvider.notifier).search();
          },
        ),
      ],
    );
  }
}

final class _SearchTextField extends StatefulWidget {
  const _SearchTextField({
    this.onChanged,
    this.onSubmitted,
    this.onDeleted,
  });

  /// 検索ボタンタップ時ののイベント
  final Function(String)? onChanged;

  /// 検索ボタンタップ時ののイベント
  final Function(String)? onSubmitted;

  /// 削除ボタンタップ時ののイベント
  final GestureTapCallback? onDeleted;

  @override
  State<_SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<_SearchTextField> {
  final _controller = TextEditingController();

  OutlineInputBorder get border => OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(25),
      );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'リポジトリ検索',
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
        fillColor: Colors.grey.withOpacity(0.25),
        filled: true,
        focusedBorder: border,
        enabledBorder: border,
        disabledBorder: border,
        counterText: '',
      ),
      // 最大記入文字数
      maxLength: 15,
      keyboardType: TextInputType.text,
      onTapOutside: (event) {
        context.dismissKeyboard();
      },
      onChanged: widget.onChanged,
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
