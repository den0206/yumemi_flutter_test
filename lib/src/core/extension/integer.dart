// int型の拡張
extension DisplayExtension on int {
  // 1K=1000,1M=10000,1B=100000
  String get displayNumber {
    var shortForm = '';

    if (this < 1000) {
      shortForm = toString();
    } else if (this >= 1000 && this < 1000000) {
      shortForm = '${(this / 1000).toStringAsFixed(1)}K';
    } else if (this >= 1000000 && this < 1000000000) {
      shortForm = '${(this / 1000000).toStringAsFixed(1)}M';
    } else if (this >= 1000000000 && this < 1000000000000) {
      shortForm = '${(this / 1000000000).toStringAsFixed(1)}B';
    }

    return shortForm;
  }
}
