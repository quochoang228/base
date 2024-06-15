// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicResponse _$DynamicResponseFromJson(Map<String, dynamic> json) =>
    DynamicResponse(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      clientMessageId: json['clientMessageId'] as String?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      type: json['type'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$DynamicResponseToJson(DynamicResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'clientMessageId': instance.clientMessageId,
      'errors': instance.errors,
      'type': instance.type,
      'data': instance.data,
    };
