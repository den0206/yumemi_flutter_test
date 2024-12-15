// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../presentation/pages/github_search/github_search_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GithubSearchStateImpl _$$GithubSearchStateImplFromJson(
        Map<String, dynamic> json) =>
    _$GithubSearchStateImpl(
      query: json['query'] as String? ?? '',
      repositories: (json['repositories'] as List<dynamic>?)
              ?.map((e) => RepositorySchema.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalCount: (json['total_count'] as num?)?.toInt() ?? 0,
      page: (json['page'] as num?)?.toInt() ?? 1,
      isLoading: json['is_loading'] as bool? ?? false,
    );

Map<String, dynamic> _$$GithubSearchStateImplToJson(
        _$GithubSearchStateImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'repositories': instance.repositories.map((e) => e.toJson()).toList(),
      'total_count': instance.totalCount,
      'page': instance.page,
      'is_loading': instance.isLoading,
    };
