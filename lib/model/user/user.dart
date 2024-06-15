import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(
  explicitToJson: true,
)

class User {
  final String? employeeCode;
  final String? userName;
  final String? email;
  final String? token;

  const User({
    this.employeeCode,
    this.userName,
    this.email,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}