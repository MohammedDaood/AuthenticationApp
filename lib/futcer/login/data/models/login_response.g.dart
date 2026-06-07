// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      auth_device: json['auth_device'] == null
          ? null
          : AuthDeviceData.fromJson(
              json['auth_device'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{'auth_device': instance.auth_device};

AuthDeviceData _$AuthDeviceDataFromJson(Map<String, dynamic> json) =>
    AuthDeviceData(
      id: json['id'] as String?,
      android_id: json['android_id'] as String?,
      employee: json['employee'] as String?,
    );

Map<String, dynamic> _$AuthDeviceDataToJson(AuthDeviceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'android_id': instance.android_id,
      'employee': instance.employee,
    };
