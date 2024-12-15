// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../../../../domain/entity/github/repository/search/response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchRepositoryResponse _$SearchRepositoryResponseFromJson(
    Map<String, dynamic> json) {
  return _SearchRepositoryResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchRepositoryResponse {
  int get totalCount => throw _privateConstructorUsedError;
  List<RepositorySchema> get items => throw _privateConstructorUsedError;

  /// Serializes this SearchRepositoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchRepositoryResponseCopyWith<SearchRepositoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchRepositoryResponseCopyWith<$Res> {
  factory $SearchRepositoryResponseCopyWith(SearchRepositoryResponse value,
          $Res Function(SearchRepositoryResponse) then) =
      _$SearchRepositoryResponseCopyWithImpl<$Res, SearchRepositoryResponse>;
  @useResult
  $Res call({int totalCount, List<RepositorySchema> items});
}

/// @nodoc
class _$SearchRepositoryResponseCopyWithImpl<$Res,
        $Val extends SearchRepositoryResponse>
    implements $SearchRepositoryResponseCopyWith<$Res> {
  _$SearchRepositoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RepositorySchema>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchRepositoryResponseImplCopyWith<$Res>
    implements $SearchRepositoryResponseCopyWith<$Res> {
  factory _$$SearchRepositoryResponseImplCopyWith(
          _$SearchRepositoryResponseImpl value,
          $Res Function(_$SearchRepositoryResponseImpl) then) =
      __$$SearchRepositoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalCount, List<RepositorySchema> items});
}

/// @nodoc
class __$$SearchRepositoryResponseImplCopyWithImpl<$Res>
    extends _$SearchRepositoryResponseCopyWithImpl<$Res,
        _$SearchRepositoryResponseImpl>
    implements _$$SearchRepositoryResponseImplCopyWith<$Res> {
  __$$SearchRepositoryResponseImplCopyWithImpl(
      _$SearchRepositoryResponseImpl _value,
      $Res Function(_$SearchRepositoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? items = null,
  }) {
    return _then(_$SearchRepositoryResponseImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RepositorySchema>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchRepositoryResponseImpl implements _SearchRepositoryResponse {
  const _$SearchRepositoryResponseImpl(
      {required this.totalCount, required final List<RepositorySchema> items})
      : _items = items;

  factory _$SearchRepositoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchRepositoryResponseImplFromJson(json);

  @override
  final int totalCount;
  final List<RepositorySchema> _items;
  @override
  List<RepositorySchema> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'SearchRepositoryResponse(totalCount: $totalCount, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRepositoryResponseImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalCount, const DeepCollectionEquality().hash(_items));

  /// Create a copy of SearchRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchRepositoryResponseImplCopyWith<_$SearchRepositoryResponseImpl>
      get copyWith => __$$SearchRepositoryResponseImplCopyWithImpl<
          _$SearchRepositoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchRepositoryResponseImplToJson(
      this,
    );
  }
}

abstract class _SearchRepositoryResponse implements SearchRepositoryResponse {
  const factory _SearchRepositoryResponse(
          {required final int totalCount,
          required final List<RepositorySchema> items}) =
      _$SearchRepositoryResponseImpl;

  factory _SearchRepositoryResponse.fromJson(Map<String, dynamic> json) =
      _$SearchRepositoryResponseImpl.fromJson;

  @override
  int get totalCount;
  @override
  List<RepositorySchema> get items;

  /// Create a copy of SearchRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchRepositoryResponseImplCopyWith<_$SearchRepositoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RepositorySchema _$RepositorySchemaFromJson(Map<String, dynamic> json) {
  return _RepositorySchema.fromJson(json);
}

/// @nodoc
mixin _$RepositorySchema {
  String get fullName => throw _privateConstructorUsedError;
  OwnerSchema get owner => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get stargazersCount => throw _privateConstructorUsedError;
  int get watchersCount => throw _privateConstructorUsedError;
  int get forksCount => throw _privateConstructorUsedError;
  int get openIssuesCount => throw _privateConstructorUsedError;
  String get htmlUrl => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;

  /// Serializes this RepositorySchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepositorySchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepositorySchemaCopyWith<RepositorySchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositorySchemaCopyWith<$Res> {
  factory $RepositorySchemaCopyWith(
          RepositorySchema value, $Res Function(RepositorySchema) then) =
      _$RepositorySchemaCopyWithImpl<$Res, RepositorySchema>;
  @useResult
  $Res call(
      {String fullName,
      OwnerSchema owner,
      String? description,
      int stargazersCount,
      int watchersCount,
      int forksCount,
      int openIssuesCount,
      String htmlUrl,
      String? language});

  $OwnerSchemaCopyWith<$Res> get owner;
}

/// @nodoc
class _$RepositorySchemaCopyWithImpl<$Res, $Val extends RepositorySchema>
    implements $RepositorySchemaCopyWith<$Res> {
  _$RepositorySchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepositorySchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? owner = null,
    Object? description = freezed,
    Object? stargazersCount = null,
    Object? watchersCount = null,
    Object? forksCount = null,
    Object? openIssuesCount = null,
    Object? htmlUrl = null,
    Object? language = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as OwnerSchema,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchersCount: null == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int,
      forksCount: null == forksCount
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int,
      openIssuesCount: null == openIssuesCount
          ? _value.openIssuesCount
          : openIssuesCount // ignore: cast_nullable_to_non_nullable
              as int,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of RepositorySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OwnerSchemaCopyWith<$Res> get owner {
    return $OwnerSchemaCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RepositorySchemaImplCopyWith<$Res>
    implements $RepositorySchemaCopyWith<$Res> {
  factory _$$RepositorySchemaImplCopyWith(_$RepositorySchemaImpl value,
          $Res Function(_$RepositorySchemaImpl) then) =
      __$$RepositorySchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fullName,
      OwnerSchema owner,
      String? description,
      int stargazersCount,
      int watchersCount,
      int forksCount,
      int openIssuesCount,
      String htmlUrl,
      String? language});

  @override
  $OwnerSchemaCopyWith<$Res> get owner;
}

/// @nodoc
class __$$RepositorySchemaImplCopyWithImpl<$Res>
    extends _$RepositorySchemaCopyWithImpl<$Res, _$RepositorySchemaImpl>
    implements _$$RepositorySchemaImplCopyWith<$Res> {
  __$$RepositorySchemaImplCopyWithImpl(_$RepositorySchemaImpl _value,
      $Res Function(_$RepositorySchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepositorySchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? owner = null,
    Object? description = freezed,
    Object? stargazersCount = null,
    Object? watchersCount = null,
    Object? forksCount = null,
    Object? openIssuesCount = null,
    Object? htmlUrl = null,
    Object? language = freezed,
  }) {
    return _then(_$RepositorySchemaImpl(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as OwnerSchema,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchersCount: null == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int,
      forksCount: null == forksCount
          ? _value.forksCount
          : forksCount // ignore: cast_nullable_to_non_nullable
              as int,
      openIssuesCount: null == openIssuesCount
          ? _value.openIssuesCount
          : openIssuesCount // ignore: cast_nullable_to_non_nullable
              as int,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepositorySchemaImpl implements _RepositorySchema {
  const _$RepositorySchemaImpl(
      {required this.fullName,
      required this.owner,
      required this.description,
      required this.stargazersCount,
      required this.watchersCount,
      required this.forksCount,
      required this.openIssuesCount,
      required this.htmlUrl,
      this.language});

  factory _$RepositorySchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepositorySchemaImplFromJson(json);

  @override
  final String fullName;
  @override
  final OwnerSchema owner;
  @override
  final String? description;
  @override
  final int stargazersCount;
  @override
  final int watchersCount;
  @override
  final int forksCount;
  @override
  final int openIssuesCount;
  @override
  final String htmlUrl;
  @override
  final String? language;

  @override
  String toString() {
    return 'RepositorySchema(fullName: $fullName, owner: $owner, description: $description, stargazersCount: $stargazersCount, watchersCount: $watchersCount, forksCount: $forksCount, openIssuesCount: $openIssuesCount, htmlUrl: $htmlUrl, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepositorySchemaImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount) &&
            (identical(other.watchersCount, watchersCount) ||
                other.watchersCount == watchersCount) &&
            (identical(other.forksCount, forksCount) ||
                other.forksCount == forksCount) &&
            (identical(other.openIssuesCount, openIssuesCount) ||
                other.openIssuesCount == openIssuesCount) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fullName,
      owner,
      description,
      stargazersCount,
      watchersCount,
      forksCount,
      openIssuesCount,
      htmlUrl,
      language);

  /// Create a copy of RepositorySchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepositorySchemaImplCopyWith<_$RepositorySchemaImpl> get copyWith =>
      __$$RepositorySchemaImplCopyWithImpl<_$RepositorySchemaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepositorySchemaImplToJson(
      this,
    );
  }
}

abstract class _RepositorySchema implements RepositorySchema {
  const factory _RepositorySchema(
      {required final String fullName,
      required final OwnerSchema owner,
      required final String? description,
      required final int stargazersCount,
      required final int watchersCount,
      required final int forksCount,
      required final int openIssuesCount,
      required final String htmlUrl,
      final String? language}) = _$RepositorySchemaImpl;

  factory _RepositorySchema.fromJson(Map<String, dynamic> json) =
      _$RepositorySchemaImpl.fromJson;

  @override
  String get fullName;
  @override
  OwnerSchema get owner;
  @override
  String? get description;
  @override
  int get stargazersCount;
  @override
  int get watchersCount;
  @override
  int get forksCount;
  @override
  int get openIssuesCount;
  @override
  String get htmlUrl;
  @override
  String? get language;

  /// Create a copy of RepositorySchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepositorySchemaImplCopyWith<_$RepositorySchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OwnerSchema _$OwnerSchemaFromJson(Map<String, dynamic> json) {
  return _OwnerSchema.fromJson(json);
}

/// @nodoc
mixin _$OwnerSchema {
  String get login => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this OwnerSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OwnerSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OwnerSchemaCopyWith<OwnerSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerSchemaCopyWith<$Res> {
  factory $OwnerSchemaCopyWith(
          OwnerSchema value, $Res Function(OwnerSchema) then) =
      _$OwnerSchemaCopyWithImpl<$Res, OwnerSchema>;
  @useResult
  $Res call({String login, String avatarUrl});
}

/// @nodoc
class _$OwnerSchemaCopyWithImpl<$Res, $Val extends OwnerSchema>
    implements $OwnerSchemaCopyWith<$Res> {
  _$OwnerSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OwnerSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? avatarUrl = null,
  }) {
    return _then(_value.copyWith(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OwnerSchemaImplCopyWith<$Res>
    implements $OwnerSchemaCopyWith<$Res> {
  factory _$$OwnerSchemaImplCopyWith(
          _$OwnerSchemaImpl value, $Res Function(_$OwnerSchemaImpl) then) =
      __$$OwnerSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String login, String avatarUrl});
}

/// @nodoc
class __$$OwnerSchemaImplCopyWithImpl<$Res>
    extends _$OwnerSchemaCopyWithImpl<$Res, _$OwnerSchemaImpl>
    implements _$$OwnerSchemaImplCopyWith<$Res> {
  __$$OwnerSchemaImplCopyWithImpl(
      _$OwnerSchemaImpl _value, $Res Function(_$OwnerSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of OwnerSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? avatarUrl = null,
  }) {
    return _then(_$OwnerSchemaImpl(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OwnerSchemaImpl implements _OwnerSchema {
  const _$OwnerSchemaImpl({required this.login, required this.avatarUrl});

  factory _$OwnerSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnerSchemaImplFromJson(json);

  @override
  final String login;
  @override
  final String avatarUrl;

  @override
  String toString() {
    return 'OwnerSchema(login: $login, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnerSchemaImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, login, avatarUrl);

  /// Create a copy of OwnerSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnerSchemaImplCopyWith<_$OwnerSchemaImpl> get copyWith =>
      __$$OwnerSchemaImplCopyWithImpl<_$OwnerSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnerSchemaImplToJson(
      this,
    );
  }
}

abstract class _OwnerSchema implements OwnerSchema {
  const factory _OwnerSchema(
      {required final String login,
      required final String avatarUrl}) = _$OwnerSchemaImpl;

  factory _OwnerSchema.fromJson(Map<String, dynamic> json) =
      _$OwnerSchemaImpl.fromJson;

  @override
  String get login;
  @override
  String get avatarUrl;

  /// Create a copy of OwnerSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OwnerSchemaImplCopyWith<_$OwnerSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
