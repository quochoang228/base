// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      employeeCode: json['employeeCode'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'employeeCode': instance.employeeCode,
      'userName': instance.userName,
      'email': instance.email,
      'token': instance.token,
    };
