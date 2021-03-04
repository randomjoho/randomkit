import 'package:dio/dio.dart';

class HeyTeaAPIException implements Exception {

  final int code;
  final String message;

  const HeyTeaAPIException(this.code, {this.message});

  HeyTeaAPIException.fromDioError(DioError dioError) : this(
      dioError.error,
      message: dioError.toString()
  );

  @override
  String toString() {
    return 'HeyTeaAPIException [code]: $code, [message]: $message';
  }
}