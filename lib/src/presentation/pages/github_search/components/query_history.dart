import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_test/src/_generated/src/l10n/app_localizations.dart';
import 'package:yumemi_flutter_test/src/core/extension/context.dart';
import 'package:yumemi_flutter_test/src/core/widget_key/search/search_page_key.dart';
import 'package:yumemi_flutter_test/src/infrastructure/local_data_source/account_local_data_source.dart';
import 'package:yumemi_flutter_test/src/presentation/components/common_error_widget.dart';
import 'package:yumemi_flutter_test/src/presentation/components/common_loading_widget.dart';
import 'package:yumemi_flutter_test/src/presentation/notifier/query_history_notifier.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/github_search_notifier.dart';

// 履歴表示エリア
// 検索結果がない場合に表示される
final class QueryHistoryArea extends ConsumerWidget {
  const QueryHistoryArea({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(queryHistoryNotifierProvider);

    return state.when(
      data: (data) {
        // 検索履歴がない場合
        if (data.isEmpty) {
          //  多言語: Github 検索
          return Text(L10n.of(context).github_search);
        }

        // 検索履歴がある場合
        return Container(
          // 画面横幅の80%を指定
          width: context.widthPct(.8),
          margin: const EdgeInsets.all(10),
          child: Column(
            spacing: 10,
            children: [
              Row(
                children: [
                  Text(
                    //  多言語: 履歴 {current}/{max)
                    L10n.of(context).query_history(
                      data.length,
                      AccountLocalDataSource.maxQueryCount,
                    ),
                    style: context.titleSmall,
                    textAlign: TextAlign.start,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      //  動作: 履歴全削除
                      await ref
                          .read(queryHistoryNotifierProvider.notifier)
                          .deleteAll();
                    },
                  ),
                ],
              ),
              Column(
                children: data
                    .map(
                      _QueryCell.new,
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => const CommonErrorWidget(),
      loading: () => const CommonLoadingWidget(),
    );
  }
}

// 単一履歴Cell
// タップすると該当文言で検索する
class _QueryCell extends ConsumerWidget {
  const _QueryCell(
    this.query,
  );

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      key: SearchPageKey.queryHistory,
      children: [
        ListTile(
          leading: const Icon(Icons.history),
          title: Text(query),
          onTap: () async {
            // 検索文字列変更
            ref
                .read(
                  githubSearchNotifierProvider.notifier,
                )
                .onQueryChanged(query);

            // 動作: 履歴からの検索
            await ref.read(githubSearchNotifierProvider.notifier).search();
          },
          trailing: GestureDetector(
            child: const Icon(Icons.close),
            onTap: () async {
              // 動作: 単一履歴削除
              await ref
                  .read(
                    queryHistoryNotifierProvider.notifier,
                  )
                  .delete(query);
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(),
        ),
      ],
    );
  }
}