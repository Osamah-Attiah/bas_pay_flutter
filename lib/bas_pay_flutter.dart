
import 'bas_pay_flutter_platform_interface.dart';
import 'models/init_bas_sdk_model.dart';
import 'models/result_model.dart';

class BasPayFlutter {

  Future<({bool resultStatus, ResultModel? resultModel})> callBasPay({required InitBasSdkModel model}) {
    return BasPayFlutterPlatform.instance.callBasPay(model: model);
  }

}
