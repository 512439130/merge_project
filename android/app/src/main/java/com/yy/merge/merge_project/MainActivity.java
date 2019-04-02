package com.yy.merge.merge_project;

import android.os.Bundle;

import com.yy.merge.merge_project.plugin.FilePickerPlugin;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    registerCustomPlugin(this);
  }


  private static void registerCustomPlugin(PluginRegistry registrar) {

    //包名需要替换为自己的项目包名
    FilePickerPlugin.registerWith(registrar.registrarFor("com.yy.merge.merge_project.plugin.FilePickerPlugin"));
  }
}


