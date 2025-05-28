import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'bas_pay_flutter_platform_interface.dart';
import 'models/init_bas_sdk_model.dart';
import 'models/result_model.dart';

/// An implementation of [BasPayFlutterPlatform] that uses method channels.
class MethodChannelBasPayFlutter extends BasPayFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('bas_pay_flutter');


  @override
  Future<({bool resultStatus, ResultModel? resultModel})> callBasPay({required InitBasSdkModel model}) async {
    final String modelJson = jsonEncode(model.toJson());
    final result = await methodChannel.invokeMethod<String>('callBasPay', modelJson);
    if(result == null){
      return (resultStatus: false, resultModel: null);
    }
    try {
      final resultModel = ResultModel.fromJson(jsonDecode(result));
      return (resultStatus: true, resultModel: resultModel);
    }catch (e){
      return (resultStatus: false, resultModel: null);
    }


    // final String modelJson = jsonEncode(model.toJson());
    // final Map<String, String> arguments = {
    //   'com.superstore.bas_pay_flutter.EXTRA_INPUT_MESSAGE': modelJson,
    // };
    // final result = await methodChannel.invokeMapMethod<String, String>('callBasPay', modelJson);
    // return (result ?? "").toString();
  }

}
