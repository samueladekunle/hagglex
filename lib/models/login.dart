import 'package:hagglex/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable(explicitToJson: true)
class Login {
  final User user;
  final String token;
  final bool? twoFactorAuth;

  Login({
    required this.user,
    required this.token,
    required this.twoFactorAuth,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
