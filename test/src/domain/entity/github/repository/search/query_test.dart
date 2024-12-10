import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/query.dart';

void main() {
  group(
    'SearchRepositoryQuery: クエリパラメータに変換できるか',
    () {
      const q = 'hoge';
      test('q(文言)パラメータのみ', () {
        final query = const SearchRepositoryQuery(q: q).toQuery;

        expect(query['q'], q);

        expect(
          query['page'],
          null,
        );
      });

      test(
        'Pageパラメータあり',
        () {
          final query = const SearchRepositoryQuery(q: q, page: 10).toQuery;

          expect(query['q'], q);

          // 数字が文字列に変換されているか
          expect(
            query['page'],
            '10',
          );
        },
      );
    },
  );
}
