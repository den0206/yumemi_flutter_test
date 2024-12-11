import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_test/src/domain/model/sort_type.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/github_search_notifier.dart';

part '../../_generated/src/presentation/notifier/sort_type_notifier.g.dart';

// 条件検索: SortTypeを管理するクラス
@Riverpod(keepAlive: true)
final class SortTypeNotifier extends _$SortTypeNotifier {
  @override
  SortType build() {
    // デフォルトは仕様書で設定されているSortType.bestMatch
    return SortType.bestMatch;
  }

  // SortType を更新
  Future<void> updateType(SortType sortType) async {
    if (state == sortType) return;
    state = sortType;

    final query = ref.read(githubSearchNotifierProvider).query;
    if (query.isEmpty) return;

    //一度クリアする
    ref.read(githubSearchNotifierProvider.notifier).clear();

    // 現在のクエリを用いて再検索
    ref.read(githubSearchNotifierProvider.notifier).onQueryChanged(query);
    await ref.read(githubSearchNotifierProvider.notifier).search();
  }
}
