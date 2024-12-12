import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_test/src/domain/model/sort_type.dart';
import 'package:yumemi_flutter_test/src/infrastructure/local_data_source/account_local_data_source.dart';
import 'package:yumemi_flutter_test/src/presentation/pages/github_search/github_search_notifier.dart';

part '../../_generated/src/presentation/notifier/sort_type_notifier.g.dart';

// 条件検索: SortTypeを管理するクラス
@Riverpod(keepAlive: true)
final class SortTypeNotifier extends _$SortTypeNotifier {
  // ローカルデータソース
  AccountLocalDataSource get _accountLocalDataSource =>
      ref.read(accountLocalDataSourceProvider);

  @override
  FutureOr<SortType> build() async {
    // ローカルストレージから値を取得
    // ローカルに値がない場合,仕様書で設定されているSortType.bestMatch
    final type = await _accountLocalDataSource.loadSortType();
    return type;
  }

  // SortType を更新
  Future<void> updateType(SortType sortType) async {
    if (state.value == sortType) return;
    state = await AsyncValue.guard(
      () async {
        // SortType ローカル保存
        return _accountLocalDataSource.saveSortType(sortType);
      },
    );

    final query = ref.read(githubSearchNotifierProvider).query;
    if (query.isEmpty) return;

    //一度クリアする
    ref.read(githubSearchNotifierProvider.notifier).clear();

    // 現在のクエリを用いて再検索
    ref.read(githubSearchNotifierProvider.notifier).onQueryChanged(query);
    await ref.read(githubSearchNotifierProvider.notifier).search();
  }
}
