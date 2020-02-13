package com.example.p_project

import androidx.annotation.NonNull
import com.example.p_project.plugins.ParamsPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        registerCustomPlugin(flutterEngine)
    }

    /**
     * 注册自定义插件
     */
    private fun registerCustomPlugin(@NonNull flutterEngine: FlutterEngine){
        flutterEngine.plugins.add(ParamsPlugin())
    }
}
