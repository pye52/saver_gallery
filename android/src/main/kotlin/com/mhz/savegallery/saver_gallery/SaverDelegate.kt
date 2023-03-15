package com.mhz.savegallery.saver_gallery

import android.content.Context
import io.flutter.plugin.common.MethodChannel.Result as MethodResult

abstract class SaverDelegate(protected val context: Context) {
    open fun onReady() {}

    abstract fun saveFileToGallery(path: String, result: MethodResult)

    open fun onClose() {}
}