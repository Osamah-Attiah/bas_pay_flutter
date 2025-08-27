package com.superstore.bas_pay_flutter

//import io.flutter.embedding.engine.plugins.FlutterPlugin
//import io.flutter.plugin.common.MethodCall
//import io.flutter.plugin.common.MethodChannel
//import io.flutter.plugin.common.MethodChannel.MethodCallHandler
//import io.flutter.plugin.common.MethodChannel.Result
//import android.app.Activity
//import android.content.Intent
//import io.flutter.embedding.engine.plugins.activity.ActivityAware
//import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
//import androidx.activity.result.contract.ActivityResultContracts
//import androidx.activity.result.ActivityResultLauncher
//
//import kotlinx.coroutines.CompletableDeferred
//import kotlinx.coroutines.CoroutineScope
//import kotlinx.coroutines.Dispatchers
//import kotlinx.coroutines.SupervisorJob
//import kotlinx.coroutines.cancel // To cancel the scope
//import kotlinx.coroutines.launch
//import kotlinx.coroutines.withContext
//import android.util.Log
import androidx.activity.ComponentActivity
//
//import androidx.appcompat.app.AppCompatActivity
//import android.content.Context

import android.app.Activity
import android.content.Context
import android.content.Intent
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity // Or ComponentActivity if your FlutterActivity inherits from it
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import android.os.Bundle
import io.flutter.plugin.common.PluginRegistry
//import android.util.Log
//import io.flutter.plugin.common.PluginRegistry.Registrar
//import io.flutter.app.FlutterActivity
//import io.flutter.plugins.GeneratedPluginRegistrant

/** BasPayFlutterPlugin */
class BasPayFlutterPlugin: FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener  {
  /// The MethodChannel that will the communication between Flutter and native Android

  private lateinit var channel : MethodChannel

  private var activity: Activity? = null
  private var activityBinding: ActivityPluginBinding? = null
  private var pendingResult: Result? = null
  private val REQUEST_CODE = 1234


  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "bas_pay_flutter")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    pendingResult = result

    if (call.method == "callBasPay") {



      val message = call.arguments
      val intent: Intent = Intent(activity, BasActivity::class.java)
      intent.putExtra("message", message.toString())
      activity?.startActivityForResult(intent, REQUEST_CODE)
//      intent?.startActivityForResult(intent, REQUEST_CODE)
//      activity?.startActivity(intent)


    } else {
      result.notImplemented()
    }
  }



  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
//    this.activity = binding.activity
    activity = binding.activity
    activityBinding = binding
    activityBinding?.addActivityResultListener(this)
//    binding.addActivityResultListener(this)
  }


  override fun onDetachedFromActivityForConfigChanges() {
    activityBinding?.removeActivityResultListener(this)
    activityBinding = null
    activity = null

  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
//    activity = binding.activity
    activity = binding.activity
    activityBinding = binding
    activityBinding?.addActivityResultListener(this)
  }

  override fun onDetachedFromActivity() {
    activityBinding?.removeActivityResultListener(this)
    activityBinding = null
    activity = null
  }


  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {

    val resultFromIntent = data?.getStringExtra("result") ?: "errr"
//    Log.d("result ::::", "${data?.getStringExtra("result")}")
//    Log.d("resultFromIntent ::::", "${resultFromIntent}")
    pendingResult?.success(resultFromIntent)

    return true
  }

}
