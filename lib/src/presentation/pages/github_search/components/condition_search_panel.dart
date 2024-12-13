import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_flutter_test/src/core/extension/context.dart';
import 'package:yumemi_flutter_test/src/domain/model/sort_type.dart';
import 'package:yumemi_flutter_test/src/presentation/components/common_error_widget.dart';
import 'package:yumemi_flutter_test/src/presentation/components/common_loading_widget.dart';
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
          spacing: 10,
          children: [
            // SortTypeの選択
            const Text(
              '並び替え',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
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
            SizedBox(height: context.paddingBottom),
          ],
        );
      },
      loading: () => const CommonLoadingWidget(),
      error: (error, stackTrace) => const CommonErrorWidget(),
    );
  }
}
