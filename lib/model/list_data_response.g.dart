// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListDataResponse<T> _$ListDataResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ListDataResponse<T>(
      status: json['status'] as String?,
      message: json['message'] as String?,
      clientMessageId: json['clientMessageId'] as String?,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
      first: json['first'] as String?,
      recordsFiltered: json['recordsFiltered'] as String?,
      recordsTotal: json['recordsTotal'] as String?,
    );

Map<String, dynamic> _$ListDataResponseToJson<T>(
  ListDataResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'clientMessageId': instance.clientMessageId,
      'data': instance.data?.map(toJsonT).toList(),
      'first': instance.first,
      'recordsFiltered': instance.recordsFiltered,
      'recordsTotal': instance.recordsTotal,
    };
