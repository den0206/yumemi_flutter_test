import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_test/src/domain/model/sort_type.dart';
import 'package:yumemi_flutter_test/src/presentation/notifier/sort_type_notifier.dart';

// 条件選択を変更するパネル
final class ConditionSearchPanel extends ConsumerWidget {
  const ConditionSearchPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortState = ref.watch(sortTypeNotifierProvider);

    return sortState.when(
      data: (data) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // SortTypeの選択
            const SizedBox(height: 10),
            const Text(
              '並び替え',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...SortType.values.map(
              (e) {
                return RadioListTile<SortType>(
                  value: e,
                  groupValue: data,
                  title: Text(e.title),
                  onChanged: (value) async {
                    if (value == null) return;

                    //動作:  SortType の更新 & 再検索
                    await ref
                        .read(sortTypeNotifierProvider.notifier)
                        .updateType(value);
                  },
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        );
      },
      // TODO ---- 共通ローディング画面に移行
      loading: () => const Center(child: CircularProgressIndicator()),
      // TODO ---- 共通エラー画面に移行
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
    );
  }
}
