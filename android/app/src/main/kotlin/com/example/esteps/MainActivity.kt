package com.example.esteps

import android.content.Intent
import android.media.MediaPlayer
import android.provider.Settings
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.flow.channelFlow

class MainActivity: FlutterActivity() {
        private val channel = "music/channel"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel ).setMethodCallHandler{
                call, result -> if (call.method=="play"){

                    Intent(this,MusicService ::class.java).also {intent->
                        startService(intent)
                    }
        }else if (call.method=="stop") {
            Intent(this,MusicService ::class.java).also {intent->
                stopService(intent)
            }


        }else {
            result.notImplemented()
        }
        }
    }
}
