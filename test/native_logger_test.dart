import 'package:flutter_test/flutter_test.dart';
import 'package:native_logger/native_logger.dart';
import 'package:native_logger/native_logger_platform_interface.dart';
import 'package:native_logger/native_logger_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeLoggerPlatform
    with MockPlatformInterfaceMixin
    implements NativeLoggerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NativeLoggerPlatform initialPlatform = NativeLoggerPlatform.instance;

  test('$MethodChannelNativeLogger is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeLogger>());
  });

  test('getPlatformVersion', () async {
    NativeLogger nativeLoggerPlugin = NativeLogger();
    MockNativeLoggerPlatform fakePlatform = MockNativeLoggerPlatform();
    NativeLoggerPlatform.instance = fakePlatform;

    expect(await nativeLoggerPlugin.getPlatformVersion(), '42');
  });
}
