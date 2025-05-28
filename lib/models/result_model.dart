

class ResultModel {
  final bool status;
  final String message;
  final dynamic result;
  final int code;


  ResultModel({
    required this.status,
    required this.message,
    required this.result,
    required this.code,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      status:  bool.tryParse(json[ResultModelFields.status]) ?? false,
      message: json[ResultModelFields.message],
      result: json[ResultModelFields.result],
      code:  int.tryParse(json[ResultModelFields.code]) ?? 699,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[ResultModelFields.status] = status;
    data[ResultModelFields.message] = message;
    data[ResultModelFields.result] = result;
    data[ResultModelFields.code] = code;
    return data;
  }

}



abstract class ResultModelFields {
  static const String status = 'status';
  static const String message = 'message';
  static const String result = 'result';
  static const String code = 'code';
}