import 'package:json_annotation/json_annotation.dart';

part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  final String username;
  final String pairing_secret;
  final String android_id;

  LoginRequestBody({required this.username, required this.pairing_secret, required this.android_id});

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
