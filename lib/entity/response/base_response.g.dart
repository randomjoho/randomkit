// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object json) fromJsonT,
) {
  return BaseResponse<T>(
    code: json['code'] as int,
    message: json['message'] as String,
    result: fromJsonT(json['result']),
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> instance,
  Object Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'result': toJsonT(instance.result),
      'timestamp': instance.timestamp,
    };
