import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:flutter/foundation.dart';

import 'dio_interceptors.dart';

class Dior {
  static final appDio = newDioInstance();

  static Dio newDioInstance({
    Duration connectTimeout = const Duration(seconds: 30),
    Duration receiveTimeout = const Duration(seconds: 30),
    String baseUrl,
    ResponseType responseType = ResponseType.json,
    String contentType,
    bool receiveDataWhenStatusError = true,
  }) {
    final options = BaseOptions(
      connectTimeout: connectTimeout?.inMilliseconds,
      receiveTimeout: receiveTimeout?.inMilliseconds,
      baseUrl: baseUrl,
      responseType: responseType,
      contentType: contentType,
      receiveDataWhenStatusError: receiveDataWhenStatusError,
    );

    final dio = Dio(options);
    dio.interceptors.add(RandomInterceptor());
    if (kDebugMode) {
      // 开启请求日志
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }
    // A dio transformer especially for flutter, by which the json decoding will be in background with [compute] function.
    dio.transformer = FlutterTransformer();

    return dio;
  }
}
