#ifndef FLUTTER_PLUGIN_BAS_PAY_FLUTTER_PLUGIN_H_
#define FLUTTER_PLUGIN_BAS_PAY_FLUTTER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace bas_pay_flutter {

class BasPayFlutterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  BasPayFlutterPlugin();

  virtual ~BasPayFlutterPlugin();

  // Disallow copy and assign.
  BasPayFlutterPlugin(const BasPayFlutterPlugin&) = delete;
  BasPayFlutterPlugin& operator=(const BasPayFlutterPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace bas_pay_flutter

#endif  // FLUTTER_PLUGIN_BAS_PAY_FLUTTER_PLUGIN_H_
