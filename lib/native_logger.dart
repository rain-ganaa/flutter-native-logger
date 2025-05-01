
import 'dart:async';
import 'package:flutter/services.dart';

class NativeLogger {
  static const MethodChannel _channel = MethodChannel('native_logger');

  static Future<void> log(String message) async {
    await _channel.invokeMethod('log', {'message': message});
  }
}
