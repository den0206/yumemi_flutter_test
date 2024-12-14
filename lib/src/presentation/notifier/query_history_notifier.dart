import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_test/src/infrastructure/local_data_source/account_local_data_source.dart';

part '../../_generated/src/presentation/notifier/query_history_notifier.g.dart';

// 検索履歴を管理するクラス
@Riverpod(keepAlive: true)
final class QueryHistoryNotifier extends _$QueryHistoryNotifier {
  AccountLocalDataSource get _accountLocalDataSource =>
      ref.read(accountLocalDataSourceProvider);
  @override
  FutureOr<List<String>> build() async {
    return await _accountLocalDataSource.loadQueries();
  }

  // 検索履歴に追加
  Future<void> addHistory(String query) async {
    state = await AsyncValue.guard(
      () async {
        return _accountLocalDataSource.saveQuery(query);
      },
    );
  }

  // 検索履歴から単一削除
  Future<void> delete(String query) async {
    state = await AsyncValue.guard(
      () async {
        return _accountLocalDataSource.deleteQuery(query);
      },
    );
  }

  // 検索履歴全削除
  Future<void> deleteAll() async {
    await _accountLocalDataSource.deleteAllQuery();
    state = const AsyncValue.data([]);
  }
}
