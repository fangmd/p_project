package com.example.p_project

import android.util.Log

/**
 * Author: Created by fangmingdong on 2020-02-13-17:02
 * Description:
 */

fun logd(tag: String, msg: String) {
    if (BuildConfig.DEBUG) {
        Log.d(tag, msg)
    }
}