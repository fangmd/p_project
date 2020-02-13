package com.example.p_project.plugins

import androidx.annotation.NonNull
import com.example.p_project.C
import com.example.p_project.logd
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

/**
 * Author: Created by fangmingdong on 2020-02-13-17:00
 * Description:
 */
class ParamsPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), PLUGIN_NAME)
        channel.setMethodCallHandler(this)
        logd(C.TAG, "init Application")
    }

    companion object {
        private const val PLUGIN_NAME = "passon_params_plugin"

        @JvmStatic
        fun registerWith(registrar: PluginRegistry.Registrar) {
            val channel = MethodChannel(registrar.messenger(), PLUGIN_NAME)
            val plugin = ParamsPlugin()
            channel.setMethodCallHandler(plugin)
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    }


    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "dealData" -> {
                dealData(call, result)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    /**
     * flutter 端用 Map 传递数据
     * return Map
     */
    private fun dealData(call: MethodCall, result: MethodChannel.Result) {
        try {
            val intArg = call.argument<Int>("key_int")
            val strArg = call.argument<String>("key_string")

            logd(C.PARAMS_TAG, "get data from flutter: $intArg , $strArg")

            result.success(mapOf("ret_int" to 1123, "ret_str" to "data from Native"))
        } catch (e: Exception) {
            result.error("error", e.message, "")
        }
    }
}