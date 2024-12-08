import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../../_generated/src/domain/entity/github/repository/search/response.freezed.dart';
part '../../../../../_generated/src/domain/entity/github/repository/search/response.g.dart';

@freezed
class SearchRepositoryResponse with _$SearchRepositoryResponse {
  const factory SearchRepositoryResponse({
    required int totalCount,
    required List<RepositorySchema> items,
  }) = _SearchRepositoryResponse;
  factory SearchRepositoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchRepositoryResponseFromJson(json);
}

@freezed
class RepositorySchema with _$RepositorySchema {
  const factory RepositorySchema({
    required String fullName,
    required OwnerSchema owner,
    required String? description,
    required int stargazersCount,
    required int watchersCount,
    required int forksCount,
    required int openIssuesCount,
    required String htmlUrl,
    String? language,
  }) = _RepositorySchema;
  factory RepositorySchema.fromJson(Map<String, dynamic> json) =>
      _$RepositorySchemaFromJson(json);
}

@freezed
class OwnerSchema with _$OwnerSchema {
  const factory OwnerSchema({
    required String login,
    required String avatarUrl,
  }) = _OwnerSchema;

  factory OwnerSchema.fromJson(Map<String, dynamic> json) =>
      _$OwnerSchemaFromJson(json);
}
