import 'package:json_annotation/json_annotation.dart';

part 'dynamic_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class DynamicResponse {
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
  dynamic data;

  DynamicResponse({
    this.status,
    this.message,
    this.clientMessageId,
    this.errors,
    this.type,
    this.data,
  });

  factory DynamicResponse.fromJson(Map<String, dynamic> json) => _$DynamicResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DynamicResponseToJson(this);
}
