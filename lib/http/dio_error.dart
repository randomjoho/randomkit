import 'package:dio/dio.dart';

extension HeyTeaDioError on DioError {

  String toDisplayText() {
    switch (type) {
      case DioErrorType.CONNECT_TIMEOUT:
        return 'Connect Timeout';
      case DioErrorType.SEND_TIMEOUT:
        return 'Send Timeout';
      case DioErrorType.RECEIVE_TIMEOUT:
        return 'Receive Timeout';
      case DioErrorType.RESPONSE:
        switch (response.statusCode) {
          case 400:
            return '400 Bad Request';
          case 401:
            return '401 Unauthorized';
          case 402:
            return '402 Payment Required';
          case 403:
            return '403 Forbidden';
          case 404:
            return '404 服务异常';
          case 405:
            return '405 Method Not Allowed';
          case 406:
            return '406 Not Acceptable';
          case 407:
            return '407 Proxy Authentication Required';
          case 408:
            return '408 Request Timeout';
          case 409:
            return '409 Conflict';
          case 410:
            return '410 Gone';
          case 411:
            return '411 Length Required';
          case 412:
            return '412 Precondition Failed';
          case 413:
            return 'Request Entity Too Large';
          case 414:
            return 'Request-URI Too Long';
          case 415:
            return '415 Unsupported Media Type';
          case 416:
            return '416 Requested Range Not Satisfiable';
          case 417:
            return '417 Expectation Failed';
          case 418:
            return "418 I'm a teapot";
          case 421:
            return '421 Too Many Connections';
          case 422:
            return '422 Unprocessable Entity';
          case 423:
            return '423 Locked';
          case 424:
            return '424 Failed Dependency';
          case 425:
            return '425 Too Early';
          case 426:
            return '426 Upgrade Required';
          case 428:
            return '428 Precondition Required';
          case 429:
            return '429 Too Many Requests';
          case 431:
            return '431 Request Header Fields Too Large';
          case 451:
            return '451 Unavailable For Legal Reasons';
          case 500:
            return '500 服务器内部错误';
          case 501:
            return '501 Not Implemented';
          case 502:
            return '502 Bad Gateway';
          case 503:
            return '503 Service Unavailable';
          case 504:
            return '504 Gateway Timeout';
          case 505:
            return '505 HTTP Version Not Supported';
          case 506:
            return '506 Variant Also Negotiates';
          case 507:
            return '507 Insufficient Storage';
          case 508:
            return '508 Loop Detected';
          case 510:
            return '510 Not Extended';
          case 511:
            return '511 Network Authentication Required';
        }
        return 'Response Error, statusCode: ${response.statusCode}';
      case DioErrorType.CANCEL:
        return 'Request Cancelled';
      case DioErrorType.DEFAULT:
        return 'Default Error';
      default:
        return 'Undefined Error';
    }
  }
}