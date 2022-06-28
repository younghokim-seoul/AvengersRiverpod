import 'package:flutter/cupertino.dart';
import 'package:riverpod_sample/data/network/model/avengers/avengers.dart';
import 'package:riverpod_sample/screen/detail/detail_screen.dart';
import 'package:riverpod_sample/screen/home/home_screen.dart';
import 'package:riverpod_sample/screen/vedio/vedio_screen.dart';

abstract class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    late Widget _page;

    print("_page");

    switch (settings.name) {
      case HomeScreen.routeName:
        _page = const HomeScreen();
        break;
      case DetailScreen.routeName:
        final avengers = settings.arguments as Avengers;
        _page = DetailScreen(avengers: avengers);
        break;
      case VedioScreen.routeName:
        final vedioKey = settings.arguments as String;
        _page = VedioScreen(vedioKey);
        break;
      default:
        break;
    }

    return CupertinoPageRoute(builder: (context) => _page);
  }
}
