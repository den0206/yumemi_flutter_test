import 'package:flutter/material.dart';
import 'package:yumemi_flutter_test/src/domain/model/sort_type.dart';

// 条件選択を変更するパネル
final class ConditionSearchPanel extends StatelessWidget {
  const ConditionSearchPanel({super.key});

  @override
  Widget build(BuildContext context) {
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
              groupValue: SortType.bestMatch,
              title: Text(e.title),
              onChanged: (value) async {
                if (value == null) return;
                debugPrint('Sort type: $value');
              },
            );
          },
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom),
      ],
    );
  }
}
