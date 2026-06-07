import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final AuthDeviceData? auth_device;

  LoginResponse({this.auth_device});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}

@JsonSerializable()
class AuthDeviceData {
  final String? id;
  final String? android_id;
  final String? employee;

  AuthDeviceData({this.id, this.android_id, this.employee});

  factory AuthDeviceData.fromJson(Map<String, dynamic> json) => _$AuthDeviceDataFromJson(json);
}
