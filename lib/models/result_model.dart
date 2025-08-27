
import 'dart:convert' show jsonDecode;

class ResultModel {

  final dynamic response;

  ResultModel({required this.response});

  factory ResultModel.fromJson(dynamic json) {
    Map<String, dynamic> data = {};
    if(json is Map<String, dynamic>){
      data = json;
    }else if(json is String){
      data = jsonDecode(json);
    }
    return ResultModel(
      response: data,
    );
  }

  int get _statusCode => 699;

  bool get status {
    if(!response.containsKey(ResultModelFields.status)){
      return false;
    }
    return _handleStatus(response[ResultModelFields.status]);
  }

  String get message {
    if(!response.containsKey(ResultModelFields.message)){
      return "";
    }
    return response[ResultModelFields.message];
  }

  dynamic get result {
    if(!response.containsKey(ResultModelFields.result)){
      return null;
    }
    return response[ResultModelFields.result];
  }

  int get code {
    if(!response.containsKey(ResultModelFields.code)){
      return _statusCode;
    }
    return _handleCode(response[ResultModelFields.code]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ResultModelFields.status] = status;
    data[ResultModelFields.message] = message;
    data[ResultModelFields.result] = result;
    data[ResultModelFields.code] = code;
    return data;
  }

  bool _handleStatus(dynamic status) {
    if(status is bool){
      return status;
    }
    if(status is String){
      return bool.tryParse(status) ?? false;
      // return status.toLowerCase() == "true";
    }
    if(status is int){
      return status == 1;
    }
    if(status is double){
      return status == 1.0;
    }
    return false;
  }

  int _handleCode(dynamic code) {
    if(code is int){
      return code;
    }
    if(code is String){
      return int.tryParse(code) ?? _statusCode;
    }
    if(code is double){
      return code.toInt() ?? _statusCode;
    }
    return _statusCode;
  }

}



abstract class ResultModelFields {
  static const String status = 'status';
  static const String message = 'message';
  static const String result = 'result';
  static const String code = 'code';
}