import Flutter
import UIKit

public class NativeLoggerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "native_logger", binaryMessenger: registrar.messenger())
    let instance = NativeLoggerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "log", let args = call.arguments as? [String: Any],
       let message = args["message"] as? String {
      NSLog("%@", message)
      result(nil)
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}
