// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'] as String,
    twoFactorAuth: json['twoFactorAuth'] as bool?,
  );
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'user': instance.user.toJson(),
      'token': instance.token,
      'twoFactorAuth': instance.twoFactorAuth,
    };
