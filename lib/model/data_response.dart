import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  genericArgumentFactories: true,
)
class DataResponse<T> {
  @JsonKey(name: 'metadata')
  final MetaDataDTO? metadata;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'status')
  final int? status;

  @JsonKey(name: 'clientMessageId')
  final String? clientMessageId;

  @JsonKey(name: 'errors')
  final List<String>? errors;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'data')
  T? data;

  DataResponse(
    this.status,
    this.message,
    this.metadata,
    this.clientMessageId,
    this.errors,
    this.type,
    this.data,
  );

  // factory DataResponse.fromJson(
  //   Map<String, dynamic> json,
  //   T Function(Object? json) fromJsonT,
  // ) =>
  //     _$DataResponseFromJson<T>(json, fromJsonT);
  //
  // Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
  //     _$DataResponseToJson(this, toJsonT);

  // Interesting bits here → ----------------------------------- ↓ ↓
  factory DataResponse.fromJson(Map<String,dynamic> json, T Function(Object? json) fromJsonT) =>
      _$DataResponseFromJson<T>(json, fromJsonT);

  // And here → ------------- ↓ ↓
  Map<String,dynamic> toJson(Object Function(T) toJsonT) =>
      _$DataResponseToJson<T>(this, toJsonT);
}

@JsonSerializable(
  explicitToJson: true,
)
class MetaDataDTO {
  int? total;

  MetaDataDTO({
    this.total,
  });

  factory MetaDataDTO.fromJson(Map<String, dynamic> json) =>
      _$MetaDataDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataDTOToJson(this);
}
