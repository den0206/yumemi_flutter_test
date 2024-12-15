// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../../presentation/pages/github_search/github_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GithubSearchState _$GithubSearchStateFromJson(Map<String, dynamic> json) {
  return _GithubSearchState.fromJson(json);
}

/// @nodoc
mixin _$GithubSearchState {
  String get query => throw _privateConstructorUsedError;
  List<RepositorySchema> get repositories => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Serializes this GithubSearchState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GithubSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GithubSearchStateCopyWith<GithubSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubSearchStateCopyWith<$Res> {
  factory $GithubSearchStateCopyWith(
          GithubSearchState value, $Res Function(GithubSearchState) then) =
      _$GithubSearchStateCopyWithImpl<$Res, GithubSearchState>;
  @useResult
  $Res call(
      {String query,
      List<RepositorySchema> repositories,
      int totalCount,
      int page,
      bool isLoading});
}

/// @nodoc
class _$GithubSearchStateCopyWithImpl<$Res, $Val extends GithubSearchState>
    implements $GithubSearchStateCopyWith<$Res> {
  _$GithubSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GithubSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? repositories = null,
    Object? totalCount = null,
    Object? page = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      repositories: null == repositories
          ? _value.repositories
          : repositories // ignore: cast_nullable_to_non_nullable
              as List<RepositorySchema>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GithubSearchStateImplCopyWith<$Res>
    implements $GithubSearchStateCopyWith<$Res> {
  factory _$$GithubSearchStateImplCopyWith(_$GithubSearchStateImpl value,
          $Res Function(_$GithubSearchStateImpl) then) =
      __$$GithubSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String query,
      List<RepositorySchema> repositories,
      int totalCount,
      int page,
      bool isLoading});
}

/// @nodoc
class __$$GithubSearchStateImplCopyWithImpl<$Res>
    extends _$GithubSearchStateCopyWithImpl<$Res, _$GithubSearchStateImpl>
    implements _$$GithubSearchStateImplCopyWith<$Res> {
  __$$GithubSearchStateImplCopyWithImpl(_$GithubSearchStateImpl _value,
      $Res Function(_$GithubSearchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GithubSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? repositories = null,
    Object? totalCount = null,
    Object? page = null,
    Object? isLoading = null,
  }) {
    return _then(_$GithubSearchStateImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      repositories: null == repositories
          ? _value._repositories
          : repositories // ignore: cast_nullable_to_non_nullable
              as List<RepositorySchema>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GithubSearchStateImpl implements _GithubSearchState {
  const _$GithubSearchStateImpl(
      {this.query = '',
      final List<RepositorySchema> repositories = const [],
      this.totalCount = 0,
      this.page = 1,
      this.isLoading = false})
      : _repositories = repositories;

  factory _$GithubSearchStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubSearchStateImplFromJson(json);

  @override
  @JsonKey()
  final String query;
  final List<RepositorySchema> _repositories;
  @override
  @JsonKey()
  List<RepositorySchema> get repositories {
    if (_repositories is EqualUnmodifiableListView) return _repositories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_repositories);
  }

  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'GithubSearchState(query: $query, repositories: $repositories, totalCount: $totalCount, page: $page, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubSearchStateImpl &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality()
                .equals(other._repositories, _repositories) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      const DeepCollectionEquality().hash(_repositories),
      totalCount,
      page,
      isLoading);

  /// Create a copy of GithubSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubSearchStateImplCopyWith<_$GithubSearchStateImpl> get copyWith =>
      __$$GithubSearchStateImplCopyWithImpl<_$GithubSearchStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GithubSearchStateImplToJson(
      this,
    );
  }
}

abstract class _GithubSearchState implements GithubSearchState {
  const factory _GithubSearchState(
      {final String query,
      final List<RepositorySchema> repositories,
      final int totalCount,
      final int page,
      final bool isLoading}) = _$GithubSearchStateImpl;

  factory _GithubSearchState.fromJson(Map<String, dynamic> json) =
      _$GithubSearchStateImpl.fromJson;

  @override
  String get query;
  @override
  List<RepositorySchema> get repositories;
  @override
  int get totalCount;
  @override
  int get page;
  @override
  bool get isLoading;

  /// Create a copy of GithubSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GithubSearchStateImplCopyWith<_$GithubSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
