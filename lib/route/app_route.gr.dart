// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../data/network/model/avengers/avengers.dart' as _i7;
import '../screen/detail/detail_screen.dart' as _i2;
import '../screen/device/scan_screen.dart' as _i4;
import '../screen/home/home_screen.dart' as _i1;
import '../screen/vedio/vedio_screen.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i5.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i2.DetailScreen(key: args.key, avengers: args.avengers));
    },
    VedioRoute.name: (routeData) {
      final args = routeData.argsAs<VedioRouteArgs>();
      return _i5.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i3.VedioScreen(args.vedioKey, key: args.key));
    },
    ScanRoute.name: (routeData) {
      return _i5.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i4.ScanScreen());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i5.RouteConfig(HomeRoute.name, path: '/home'),
        _i5.RouteConfig(DetailRoute.name, path: '/detail'),
        _i5.RouteConfig(VedioRoute.name, path: '/vedio'),
        _i5.RouteConfig(ScanRoute.name, path: '/deviceScan')
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.DetailScreen]
class DetailRoute extends _i5.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({_i6.Key? key, required _i7.Avengers avengers})
      : super(DetailRoute.name,
            path: '/detail',
            args: DetailRouteArgs(key: key, avengers: avengers));

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({this.key, required this.avengers});

  final _i6.Key? key;

  final _i7.Avengers avengers;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, avengers: $avengers}';
  }
}

/// generated route for
/// [_i3.VedioScreen]
class VedioRoute extends _i5.PageRouteInfo<VedioRouteArgs> {
  VedioRoute({required String vedioKey, _i6.Key? key})
      : super(VedioRoute.name,
            path: '/vedio', args: VedioRouteArgs(vedioKey: vedioKey, key: key));

  static const String name = 'VedioRoute';
}

class VedioRouteArgs {
  const VedioRouteArgs({required this.vedioKey, this.key});

  final String vedioKey;

  final _i6.Key? key;

  @override
  String toString() {
    return 'VedioRouteArgs{vedioKey: $vedioKey, key: $key}';
  }
}

/// generated route for
/// [_i4.ScanScreen]
class ScanRoute extends _i5.PageRouteInfo<void> {
  const ScanRoute() : super(ScanRoute.name, path: '/deviceScan');

  static const String name = 'ScanRoute';
}
