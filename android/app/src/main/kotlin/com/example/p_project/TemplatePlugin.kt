package com.example.p_project

import android.content.Context
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

/**
 * Author: Created by fangmingdong on 2020-02-13-17:00
 * Description: 模版代码
 */
class TemplatePlugin : FlutterPlugin, MethodChannel.MethodCallHandler {

    private var mContext: Context? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "p_umeng")
        channel.setMethodCallHandler(this)
        this.mContext = flutterPluginBinding.applicationContext
        Log.d(C.TAG, "init Application")
    }

    companion object {
        private const val PLUGIN_NAME = "passon/params_plugin"

        @JvmStatic
        fun registerWith(registrar: PluginRegistry.Registrar) {
            val channel = MethodChannel(registrar.messenger(), PLUGIN_NAME)
            val plugin = TemplatePlugin()
            channel.setMethodCallHandler(plugin)
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        this.mContext = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }
}