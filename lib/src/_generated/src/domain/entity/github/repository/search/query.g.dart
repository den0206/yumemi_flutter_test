// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../../domain/entity/github/repository/search/query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchRepositoryQueryImpl _$$SearchRepositoryQueryImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchRepositoryQueryImpl(
      q: json['q'] as String,
      page: (json['page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      sort: _$JsonConverterFromJson<String, SortType>(
          json['sort'], const SortTypeConverter().fromJson),
      order: $enumDecodeNullable(_$OrderTypeEnumMap, json['order']),
    );

Map<String, dynamic> _$$SearchRepositoryQueryImplToJson(
        _$SearchRepositoryQueryImpl instance) =>
    <String, dynamic>{
      'q': instance.q,
      'page': instance.page,
      'per_page': instance.perPage,
      'sort': _$JsonConverterToJson<String, SortType>(
          instance.sort, const SortTypeConverter().toJson),
      'order': _$OrderTypeEnumMap[instance.order],
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$OrderTypeEnumMap = {
  OrderType.desc: 'desc',
  OrderType.asc: 'asc',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
