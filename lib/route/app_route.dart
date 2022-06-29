

import 'package:auto_route/auto_route.dart';
import 'package:riverpod_sample/screen/detail/detail_screen.dart';
import 'package:riverpod_sample/screen/home/home_screen.dart';
import 'package:riverpod_sample/screen/vedio/vedio_screen.dart';

export 'app_route.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: "/",
      page: HomeScreen,
      initial: true,
    ),
    AutoRoute(
      path: "/detail",
      page: DetailScreen,
    ),
    AutoRoute(
      path: "/vedio",
      page: VedioScreen,
    ),
  ],
)
class $AppRouter {}
