
import 'dart:async';

import 'package:flutter/services.dart';

class RandomKit {
  static const String packageName = 'randomkit';

  static RandomKitConfig config;

  static const MethodChannel _channel =
      const MethodChannel('randomkit');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}


class RandomKitConfig {
  final Future<List<String>> apiBaseUrlsGetter;
  final Future<Map<String, dynamic>> apiHeadersGenerator;

  const RandomKitConfig({
    this.apiBaseUrlsGetter,
    this.apiHeadersGenerator,
  });
}