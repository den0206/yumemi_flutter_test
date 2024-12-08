import 'package:freezed_annotation/freezed_annotation.dart';

part '../../_generated/src/domain/entity/test_state.freezed.dart';
part '../../_generated/src/domain/entity/test_state.g.dart';

@freezed
class TestState with _$TestState {
  const factory TestState({
    @Default('') String hoge,
  }) = _TestState;
  factory TestState.fromJson(Map<String, dynamic> json) =>
      _$TestStateFromJson(json);
}
