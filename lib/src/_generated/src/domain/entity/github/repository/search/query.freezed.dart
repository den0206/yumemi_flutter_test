// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../../../../domain/entity/github/repository/search/query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchRepositoryQuery _$SearchRepositoryQueryFromJson(
    Map<String, dynamic> json) {
  return _SearchRepositoryQuery.fromJson(json);
}

/// @nodoc
mixin _$SearchRepositoryQuery {
  String get q => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  @SortTypeConverter()
  SortType? get sort => throw _privateConstructorUsedError;
  OrderType? get order => throw _privateConstructorUsedError;

  /// Serializes this SearchRepositoryQuery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchRepositoryQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchRepositoryQueryCopyWith<SearchRepositoryQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchRepositoryQueryCopyWith<$Res> {
  factory $SearchRepositoryQueryCopyWith(SearchRepositoryQuery value,
          $Res Function(SearchRepositoryQuery) then) =
      _$SearchRepositoryQueryCopyWithImpl<$Res, SearchRepositoryQuery>;
  @useResult
  $Res call(
      {String q,
      int? page,
      int? perPage,
      @SortTypeConverter() SortType? sort,
      OrderType? order});
}

/// @nodoc
class _$SearchRepositoryQueryCopyWithImpl<$Res,
        $Val extends SearchRepositoryQuery>
    implements $SearchRepositoryQueryCopyWith<$Res> {
  _$SearchRepositoryQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchRepositoryQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? q = null,
    Object? page = freezed,
    Object? perPage = freezed,
    Object? sort = freezed,
    Object? order = freezed,
  }) {
    return _then(_value.copyWith(
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as SortType?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchRepositoryQueryImplCopyWith<$Res>
    implements $SearchRepositoryQueryCopyWith<$Res> {
  factory _$$SearchRepositoryQueryImplCopyWith(
          _$SearchRepositoryQueryImpl value,
          $Res Function(_$SearchRepositoryQueryImpl) then) =
      __$$SearchRepositoryQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String q,
      int? page,
      int? perPage,
      @SortTypeConverter() SortType? sort,
      OrderType? order});
}

/// @nodoc
class __$$SearchRepositoryQueryImplCopyWithImpl<$Res>
    extends _$SearchRepositoryQueryCopyWithImpl<$Res,
        _$SearchRepositoryQueryImpl>
    implements _$$SearchRepositoryQueryImplCopyWith<$Res> {
  __$$SearchRepositoryQueryImplCopyWithImpl(_$SearchRepositoryQueryImpl _value,
      $Res Function(_$SearchRepositoryQueryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchRepositoryQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? q = null,
    Object? page = freezed,
    Object? perPage = freezed,
    Object? sort = freezed,
    Object? order = freezed,
  }) {
    return _then(_$SearchRepositoryQueryImpl(
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as SortType?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchRepositoryQueryImpl extends _SearchRepositoryQuery {
  const _$SearchRepositoryQueryImpl(
      {required this.q,
      this.page,
      this.perPage,
      @SortTypeConverter() this.sort,
      this.order})
      : super._();

  factory _$SearchRepositoryQueryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchRepositoryQueryImplFromJson(json);

  @override
  final String q;
  @override
  final int? page;
  @override
  final int? perPage;
  @override
  @SortTypeConverter()
  final SortType? sort;
  @override
  final OrderType? order;

  @override
  String toString() {
    return 'SearchRepositoryQuery(q: $q, page: $page, perPage: $perPage, sort: $sort, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRepositoryQueryImpl &&
            (identical(other.q, q) || other.q == q) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, q, page, perPage, sort, order);

  /// Create a copy of SearchRepositoryQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchRepositoryQueryImplCopyWith<_$SearchRepositoryQueryImpl>
      get copyWith => __$$SearchRepositoryQueryImplCopyWithImpl<
          _$SearchRepositoryQueryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchRepositoryQueryImplToJson(
      this,
    );
  }
}

abstract class _SearchRepositoryQuery extends SearchRepositoryQuery {
  const factory _SearchRepositoryQuery(
      {required final String q,
      final int? page,
      final int? perPage,
      @SortTypeConverter() final SortType? sort,
      final OrderType? order}) = _$SearchRepositoryQueryImpl;
  const _SearchRepositoryQuery._() : super._();

  factory _SearchRepositoryQuery.fromJson(Map<String, dynamic> json) =
      _$SearchRepositoryQueryImpl.fromJson;

  @override
  String get q;
  @override
  int? get page;
  @override
  int? get perPage;
  @override
  @SortTypeConverter()
  SortType? get sort;
  @override
  OrderType? get order;

  /// Create a copy of SearchRepositoryQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchRepositoryQueryImplCopyWith<_$SearchRepositoryQueryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
