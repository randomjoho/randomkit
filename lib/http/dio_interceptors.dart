import 'package:dio/dio.dart';
import 'package:randomkit/entity/response/base_response.dart';
import 'package:randomkit/exception/api_exception.dart';
import 'package:randomkit/randomkit.dart';

class HeyTeaInterceptor extends Interceptor {
  static int _lastTimestamp;
  static int get lastTimestamp => _lastTimestamp;
  static set lastTimestamp(value) {
    final oldValue = lastTimestamp;
    if (oldValue == null || oldValue < value) {
      _lastTimestamp = value;
    }
  }

  /// 在此处改造请求，统一加入Token
  @override
  Future onRequest(RequestOptions options) async {
    if (await options.isFromBaseUrl()) {
      if (options.headers == null) {
        options.headers = {};
      }

      final headers = options.headers;
      final apiHeaders = await RandomKit.config?.apiHeadersGenerator;
      if (apiHeaders != null) {
        for (final apiHeader in apiHeaders.entries) {
          headers.putIfAbsent(apiHeader.key, () => apiHeader.value);
        }
      }
    }

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) async {
    if (await response.request.isFromBaseUrl()) {
      final entity = BaseResponse.tryParse(response.data);

      if (entity != null) {
        lastTimestamp = entity.timestamp;

        if (entity.isSuccess == true) {
          // 抛掉BaseResponse的包装，直接返回result
          response.data = entity.result;
          return response;
        }

        // 触发异常
        throw DioError(
          request: response.request,
          response: response,
          type: DioErrorType.RESPONSE,
          error: HeyTeaAPIException(
            entity.code,
            message: entity.message,
          ),
        );
      }
    }

    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) async {
    if (err.type == DioErrorType.RESPONSE && await err.response.request.isFromBaseUrl()) {
      final entity = BaseResponse.tryParse(err.response.data);

      if (entity != null) {
        lastTimestamp = entity.timestamp;

        return DioError(
          request: err.request,
          response: err.response,
          type: DioErrorType.RESPONSE,
          error: HeyTeaAPIException(
            entity.code,
            message: entity.message,
          ),
        );
      }
    }

    return super.onError(err);
  }
}

extension RequestOptionsExt on RequestOptions {
  Future<bool> isFromBaseUrl() async {
    final baseUrls = await RandomKit.config?.apiBaseUrlsGetter;
    final test = (baseUrl) => uri.toString().startsWith(baseUrl);
    return baseUrls?.any(test) == true;
  }
}
