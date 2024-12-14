import 'package:shared_preferences/shared_preferences.dart';

// ローカル保存を担当する列挙体
// 保存したいKeyを列挙体値に追加してください
// ローカルデータソース 経由で使用してください
enum StorageService {
  // 条件検索: ソートタイプ
  sortType,
  // テーマモード(Light/Dark モード)
  themeMode,
  // 検索履歴
  queryHistory;

  // String 型の保存
  Future<bool> saveString(String value) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(name, value);
  }

  // String 型の読み込み
  Future<String?> loadString() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(name);
  }

  // List<String> 型の保存
  Future<bool> saveArrayString(List<String> value) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setStringList(name, value);
  }

  // List<String> 型の読み込み
  Future<List<String>?> loadArrayString() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getStringList(name);
  }

  Future<bool> deleteLocal() async {
    final pref = await SharedPreferences.getInstance();
    return pref.remove(name);
  }
}
