//
//  ParamsPlugin.swift
//  Runner
//
//  Created by Double on 2020/2/13.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation

public class ParamsPlugin: NSObject {
    
    public static func register(controller: FlutterViewController) {
        let paramsChannel = FlutterMethodChannel(name: "passon_params_plugin", binaryMessenger:controller.binaryMessenger)
        paramsChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            ParamsPlugin().dealData(call: call, result: result)
        })
    }
    
    public  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if(call.method == "dealData"){
            dealData(call: call, result: result)
        }else{
            result(FlutterMethodNotImplemented)
        }
    }
    
    public  func dealData(call: FlutterMethodCall, result: FlutterResult) {
        // result(FlutterError(code: "UNAVAILABLE", message: "Battery info unavailable", details: nil))
        let args = call.arguments as! NSDictionary
        let key:String? = args.value(forKey: "key_int") as? String
        let channel:Int? = args.value(forKey: "key_string") as? Int
        result(["ret_int": 123123,
                "ret_str": "Access swift Data"])
    }
    
    
}
