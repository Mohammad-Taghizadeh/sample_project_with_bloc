import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:sample_project_with_bloc/domain/model/model.dart';

Future<DeviceInfo> getDeviceDetails()async {
  String name= "UNKNOWN";
  String identifier= "UNKNOWN";
  String version = "UNKNOWN";

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try{
    if(Platform.isAndroid){
      var build = await deviceInfoPlugin.androidInfo;
      name = "${build.brand} ${build.model}";
      identifier = build.androidId ?? "";
      version = build.version.codename??"";
    }else if (Platform.isIOS){
      var build = await deviceInfoPlugin.iosInfo;
      name = "${build.name} ${build.model}";
      identifier = build.identifierForVendor ?? "";
      version = build.systemVersion ?? "";
    }
  } on PlatformException {
    return DeviceInfo(name, identifier, version);
  }
    return DeviceInfo(name, identifier, version);
}