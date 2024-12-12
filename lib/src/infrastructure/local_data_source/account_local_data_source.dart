import 'package:yumemi_flutter_test/src/core/service/storage_service.dart';
import 'package:yumemi_flutter_test/src/domain/model/sort_type.dart';

final class AccountLocalDataSource {
  // ローカル保存: SortType
  Future<SortType> saveSortType(SortType sortType) async {
    await StorageService.sortType.saveString(sortType.name);
    return sortType;
  }

  // ローカル読み込み: SortType
  // データがない場合は SortType.bestMatch が返却される
  Future<SortType> loadSortType() async {
    final sortType = await StorageService.sortType.loadString();
    return SortType.values.firstWhere(
      (e) => e.name == sortType,
      orElse: () => SortType.bestMatch,
    );
  }

  // ローカル削除: SortType
  Future<bool> deleteSortType() async {
    return StorageService.sortType.deleteLocal();
  }
}
