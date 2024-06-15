import 'package:json_annotation/json_annotation.dart';

part 'list_data_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  genericArgumentFactories: true,
)
class ListDataResponse<T> {
  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'clientMessageId')
  final String? clientMessageId;
  @JsonKey(name: 'data')
  List<T>? data;
  @JsonKey(name: "first")
  final String? first;
  @JsonKey(name: "recordsFiltered")
  final String? recordsFiltered;
  @JsonKey(name: "recordsTotal")
  final String? recordsTotal;

  ListDataResponse({
    this.status,
    this.message,
    this.clientMessageId,
    this.data,
    this.first,
    this.recordsFiltered,
    this.recordsTotal,
  });

  factory ListDataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ListDataResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$ListDataResponseToJson(this, toJsonT);
}
