import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'bas_pay_flutter_method_channel.dart';
import 'models/init_bas_sdk_model.dart';
import 'models/result_model.dart';

abstract class BasPayFlutterPlatform extends PlatformInterface {
  /// Constructs a BasPayFlutterPlatform.
  BasPayFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static BasPayFlutterPlatform _instance = MethodChannelBasPayFlutter();

  /// The default instance of [BasPayFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelBasPayFlutter].
  static BasPayFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BasPayFlutterPlatform] when
  /// they register themselves.
  static set instance(BasPayFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<({bool resultStatus, ResultModel? resultModel})> callBasPay({required InitBasSdkModel model}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

}
