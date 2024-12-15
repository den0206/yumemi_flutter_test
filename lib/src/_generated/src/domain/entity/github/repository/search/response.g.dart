// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../../domain/entity/github/repository/search/response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchRepositoryResponseImpl _$$SearchRepositoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchRepositoryResponseImpl(
      totalCount: (json['total_count'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => RepositorySchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchRepositoryResponseImplToJson(
        _$SearchRepositoryResponseImpl instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

_$RepositorySchemaImpl _$$RepositorySchemaImplFromJson(
        Map<String, dynamic> json) =>
    _$RepositorySchemaImpl(
      fullName: json['full_name'] as String,
      owner: OwnerSchema.fromJson(json['owner'] as Map<String, dynamic>),
      description: json['description'] as String?,
      stargazersCount: (json['stargazers_count'] as num).toInt(),
      watchersCount: (json['watchers_count'] as num).toInt(),
      forksCount: (json['forks_count'] as num).toInt(),
      openIssuesCount: (json['open_issues_count'] as num).toInt(),
      htmlUrl: json['html_url'] as String,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$$RepositorySchemaImplToJson(
        _$RepositorySchemaImpl instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'owner': instance.owner.toJson(),
      'description': instance.description,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'forks_count': instance.forksCount,
      'open_issues_count': instance.openIssuesCount,
      'html_url': instance.htmlUrl,
      'language': instance.language,
    };

_$OwnerSchemaImpl _$$OwnerSchemaImplFromJson(Map<String, dynamic> json) =>
    _$OwnerSchemaImpl(
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$$OwnerSchemaImplToJson(_$OwnerSchemaImpl instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };
