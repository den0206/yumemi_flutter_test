import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_test/src/domain/model/sort_type.dart';

void main() {
  group(
    'SortType',
    () {
      const values = SortType.values;

      test(
        'queryValue Test',
        () {
          // API側で設定されている値
          final gitHubQueries = [
            'bestmatch',
            'stars',
            'forks',
            'help-wanted-issues',
          ];

          for (final element in values) {
            expect(gitHubQueries.contains(element.queryValue), true);
          }
        },
      );
    },
  );
}
