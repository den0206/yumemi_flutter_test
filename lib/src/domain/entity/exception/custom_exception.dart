// 当プロジェクトで定義する例外の抽象クラス
abstract class CustomException implements Exception {
  const CustomException();

  Object get message => 'error';
}
