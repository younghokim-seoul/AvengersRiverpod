

import 'package:auto_route/auto_route.dart';
import 'package:riverpod_sample/screen/detail/detail_screen.dart';
import 'package:riverpod_sample/screen/device/device_screen.dart';
import 'package:riverpod_sample/screen/device/scan_screen.dart';
import 'package:riverpod_sample/screen/home/home_screen.dart';
import 'package:riverpod_sample/screen/vedio/vedio_screen.dart';

export 'app_route.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: HomeScreen.routeName,
      page: HomeScreen,
      initial: true,
    ),
    AutoRoute(
      path: DetailScreen.routeName,
      page: DetailScreen,
    ),
    AutoRoute(
      path: VedioScreen.routeName,
      page: VedioScreen,
    ),
    AutoRoute(
      path: ScanScreen.routeName,
      page: ScanScreen,
    ),
    AutoRoute(
      path: DeviceScreen.routeName,
      page: DeviceScreen,
    ),
  ],
)
class $AppRouter {}
