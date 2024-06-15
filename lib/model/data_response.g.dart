// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse<T> _$DataResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    DataResponse<T>(
      (json['status'] as num?)?.toInt(),
      json['message'] as String?,
      json['metadata'] == null
          ? null
          : MetaDataDTO.fromJson(json['metadata'] as Map<String, dynamic>),
      json['clientMessageId'] as String?,
      (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['type'] as String?,
      _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$DataResponseToJson<T>(
  DataResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'metadata': instance.metadata?.toJson(),
      'message': instance.message,
      'status': instance.status,
      'clientMessageId': instance.clientMessageId,
      'errors': instance.errors,
      'type': instance.type,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

MetaDataDTO _$MetaDataDTOFromJson(Map<String, dynamic> json) => MetaDataDTO(
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaDataDTOToJson(MetaDataDTO instance) =>
    <String, dynamic>{
      'total': instance.total,
    };
