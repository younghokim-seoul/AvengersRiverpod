import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final locationProvider = FutureProvider<bool>((ref) async {
  var requestStatus = await Permission.location.request();
  return requestStatus.isGranted || requestStatus.isLimited;
});
