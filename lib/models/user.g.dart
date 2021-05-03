// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    username: json['username'] as String,
    email: json['email'] as String,
    phoneNumber: json['phonenumber'] as String,
    emailVerified: json['emailVerified'] as bool,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'phonenumber': instance.phoneNumber,
      'emailVerified': instance.emailVerified,
    };
