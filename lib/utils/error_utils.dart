import 'dart:io';
import 'package:randomkit/http/dio_error.dart';
import 'package:dio/dio.dart';
import 'package:randomkit/exception/api_exception.dart';

class ErrorUtils {
  static dynamic errorFrom(dynamic error) {
    var originalError;

    switch (error.runtimeType) {
      case DioError:
        final DioError dioError = error;
        originalError = dioError.error;
        break;
    }

    return originalError == null ? error : errorFrom(originalError);
  }

  static String messageFrom(dynamic error) {
    final originalError = errorFrom(error);
    String message;

    switch (originalError.runtimeType) {
      case DioError:
        final DioError dioError = originalError;
        message = dioError.toDisplayText();
        break;
      case RandomAPIException:
        final apiException = originalError as RandomAPIException;
        message = apiException.message;
        break;
      case HttpException:
      case SocketException:
        message = '网络异常，请检查您的网络连接';
        break;
      default:
        message = '$originalError';
        break;
    }

    return message;
  }

  static int apiExceptionCodeFrom(dynamic error) {
    final err = ErrorUtils.errorFrom(error);
    if (err is RandomAPIException) {
      return err.code;
    }

    return null;
  }
}
