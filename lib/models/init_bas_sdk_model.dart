

class InitBasSdkModel {
  final String trxToken;
  String? userIdentifier;
  String? fullName;
  String? language;
  final String platform;

  InitBasSdkModel({
    required this.trxToken,
    this.userIdentifier,
    this.fullName,
    this.language,
  }) : platform = "Flutter";


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[InitBasSdkModelFields.trxToken] = trxToken;
    data[InitBasSdkModelFields.userIdentifier] = userIdentifier;
    data[InitBasSdkModelFields.fullName] = fullName;
    data[InitBasSdkModelFields.language] = language;
    data[InitBasSdkModelFields.platform] = platform;
    return data;
  }

}


abstract class InitBasSdkModelFields {
  static const String trxToken = 'trxToken';
  static const String userIdentifier = 'userIdentifier';
  static const String fullName = 'fullName';
  static const String language = 'language';
  static const String platform = 'platform';
}