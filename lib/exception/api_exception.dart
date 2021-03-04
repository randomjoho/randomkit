import 'package:dio/dio.dart';

class RandomAPIException implements Exception {

  final int code;
  final String message;

  const RandomAPIException(this.code, {this.message});

  RandomAPIException.fromDioError(DioError dioError) : this(
      dioError.error,
      message: dioError.toString()
  );

  @override
  String toString() {
    return 'RandomAPIException [code]: $code, [message]: $message';
  }
}