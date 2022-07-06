import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final locationProvider = FutureProvider<bool>((ref) async {
  if (Platform.isIOS) return true;

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  if (Platform.isAndroid && androidInfo.version.sdkInt! <= 30) {
    var requestStatus = await Permission.location.request();
    return requestStatus.isGranted || requestStatus.isLimited;
  } else {
    Map<Permission, PermissionStatus> statuses = await [Permission.bluetoothScan,Permission.bluetoothConnect,Permission.location].request();
    statuses[Permission.location]?.isGranted;
    return await Permission.bluetoothScan.isGranted && await Permission.bluetoothConnect.isGranted && await Permission.location.isGranted;
  }

});
