// import 'package:flutter_test/flutter_test.dart';
// import 'package:bas_pay_flutter/bas_pay_flutter.dart';
// import 'package:bas_pay_flutter/bas_pay_flutter_platform_interface.dart';
// import 'package:bas_pay_flutter/bas_pay_flutter_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';
//
// class MockBasPayFlutterPlatform
//     with MockPlatformInterfaceMixin
//     implements BasPayFlutterPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final BasPayFlutterPlatform initialPlatform = BasPayFlutterPlatform.instance;
//
//   test('$MethodChannelBasPayFlutter is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelBasPayFlutter>());
//   });
//
//   test('getPlatformVersion', () async {
//     BasPayFlutter basPayFlutterPlugin = BasPayFlutter();
//     MockBasPayFlutterPlatform fakePlatform = MockBasPayFlutterPlatform();
//     BasPayFlutterPlatform.instance = fakePlatform;
//
//     expect(await basPayFlutterPlugin.getPlatformVersion(), '42');
//   });
// }
