
package com.example.farm_business_manager

import android.Manifest
import android.content.pm.PackageManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val channelName = "farm_business_manager/sms"
    private val smsPermissionRequestCode = 1001
    private var permissionResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName
        ).setMethodCallHandler { call, result ->

            when (call.method) {
    "hasSmsPermission" -> {
        result.success(
            checkSelfPermission(Manifest.permission.RECEIVE_SMS) ==
                PackageManager.PERMISSION_GRANTED
        )
    }

    "requestSmsPermission" -> {
        if (checkSelfPermission(Manifest.permission.RECEIVE_SMS) ==
            PackageManager.PERMISSION_GRANTED
        ) {
            result.success(true)
        } else if (permissionResult != null) {
            result.error(
                "REQUEST_IN_PROGRESS",
                "Permission request already running",
                null
            )
        } else {
            permissionResult = result
            requestPermissions(
                arrayOf(Manifest.permission.RECEIVE_SMS),
                smsPermissionRequestCode
            )
        }
    }

    "setAllowedSenders" -> {
        val senders =
            call.argument<List<String>>("senders") ?: emptyList()
        SocietySmsQueue.setAllowedSenders(this, senders)
        result.success(true)
    }

    "getPendingSms" -> {
        result.success(SocietySmsQueue.getAll(this))
    }

    "acknowledgePendingSms" -> {
        val ids = call.argument<List<String>>("ids") ?: emptyList()
        SocietySmsQueue.remove(this, ids)
        result.success(true)
    }

    else -> result.notImplemented()
}
        }
    }

    @Deprecated("Deprecated in Android API")
    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)

        if (requestCode == smsPermissionRequestCode) {
            val granted = grantResults.isNotEmpty() &&
                grantResults[0] == PackageManager.PERMISSION_GRANTED

            permissionResult?.success(granted)
            permissionResult = null
        }
    }
}
