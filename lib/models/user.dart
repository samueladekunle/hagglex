import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String username;
  final String email;
  @JsonKey(name: 'phonenumber')
  final String phoneNumber;
  final bool emailVerified;

  User({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.emailVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
