import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_test/src/domain/entity/test_state.dart';

part '../../_generated/src/domain/entity/test_notifier.g.dart';

@riverpod
final class TestNotifier extends _$TestNotifier {
  @override
  TestState build() {
    return const TestState(hoge: 'hoge');
  }
}
