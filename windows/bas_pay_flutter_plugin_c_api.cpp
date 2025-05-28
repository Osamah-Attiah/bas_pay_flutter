#include "include/bas_pay_flutter/bas_pay_flutter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "bas_pay_flutter_plugin.h"

void BasPayFlutterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  bas_pay_flutter::BasPayFlutterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
