import 'package:flutter_test/flutter_test.dart';
import 'package:yumemi_flutter_test/src/domain/entity/github/repository/search/query.dart';
import 'package:yumemi_flutter_test/src/domain/model/sort_type.dart';

import '../../../../factory/github_factory.dart';

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

      test(
        'Sortパラメータあり',
        () {
          // 5つのダミーデータを生成
          final query =
              const SearchRepositoryQuery(q: q, sort: SortType.helpWantedIssues)
                  .toQuery;

          expect(query['q'], q);

          // 仕様書で定義された文字列に変換しているか
          expect(
            query['sort'],
            'help-wanted-issues',
          );
        },
      );

      test(
        'ランダムテスト',
        () {
          // 5つのダミーデータを生成
          final factories =
              SearchRepositoryQueryFactory().generateFakeList(length: 5);

          for (final fact in factories) {
            // クエリへの変換 Map<String,String>
            final toQuery = fact.toQuery;

            // 文言が一致しているか
            expect(toQuery['q'], fact.q);

            if (fact.sort != null) {
              // sort が nullでない場合、仕様書で定義された文字列に変換しているか
              expect(toQuery['sort'], fact.sort!.queryValue);
            }

            if (fact.order != null) {
              // order が nullでない場合、仕様書で定義された文字列に変換しているか
              expect(toQuery['order'], fact.order!.name);
            }

            if (fact.perPage != null) {
              // perPage が nullでない場合、数値を文字列に変換しているか
              expect(toQuery['per_page'], fact.perPage!.toString());
            }

            if (fact.page != null) {
              // page が nullでない場合、数値を文字列に変換しているか
              expect(toQuery['page'], fact.page!.toString());
            }
          }
        },
      );
    },
  );
}
