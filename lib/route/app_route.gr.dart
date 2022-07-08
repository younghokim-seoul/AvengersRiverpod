// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart' as _i9;

import '../data/network/model/avengers/avengers.dart' as _i8;
import '../screen/detail/detail_screen.dart' as _i2;
import '../screen/device/device_screen.dart' as _i5;
import '../screen/device/scan_screen.dart' as _i4;
import '../screen/home/home_screen.dart' as _i1;
import '../screen/vedio/vedio_screen.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i2.DetailScreen(key: args.key, avengers: args.avengers));
    },
    VedioRoute.name: (routeData) {
      final args = routeData.argsAs<VedioRouteArgs>();
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i3.VedioScreen(args.vedioKey, key: args.key));
    },
    ScanRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i4.ScanScreen());
    },
    DeviceRoute.name: (routeData) {
      final args = routeData.argsAs<DeviceRouteArgs>();
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i5.DeviceScreen(key: args.key, device: args.device));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i6.RouteConfig(HomeRoute.name, path: '/home'),
        _i6.RouteConfig(DetailRoute.name, path: '/detail'),
        _i6.RouteConfig(VedioRoute.name, path: '/vedio'),
        _i6.RouteConfig(ScanRoute.name, path: '/deviceScan'),
        _i6.RouteConfig(DeviceRoute.name, path: '/deviceDetail')
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.DetailScreen]
class DetailRoute extends _i6.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({_i7.Key? key, required _i8.Avengers avengers})
      : super(DetailRoute.name,
            path: '/detail',
            args: DetailRouteArgs(key: key, avengers: avengers));

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({this.key, required this.avengers});

  final _i7.Key? key;

  final _i8.Avengers avengers;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, avengers: $avengers}';
  }
}

/// generated route for
/// [_i3.VedioScreen]
class VedioRoute extends _i6.PageRouteInfo<VedioRouteArgs> {
  VedioRoute({required String vedioKey, _i7.Key? key})
      : super(VedioRoute.name,
            path: '/vedio', args: VedioRouteArgs(vedioKey: vedioKey, key: key));

  static const String name = 'VedioRoute';
}

class VedioRouteArgs {
  const VedioRouteArgs({required this.vedioKey, this.key});

  final String vedioKey;

  final _i7.Key? key;

  @override
  String toString() {
    return 'VedioRouteArgs{vedioKey: $vedioKey, key: $key}';
  }
}

/// generated route for
/// [_i4.ScanScreen]
class ScanRoute extends _i6.PageRouteInfo<void> {
  const ScanRoute() : super(ScanRoute.name, path: '/deviceScan');

  static const String name = 'ScanRoute';
}

/// generated route for
/// [_i5.DeviceScreen]
class DeviceRoute extends _i6.PageRouteInfo<DeviceRouteArgs> {
  DeviceRoute({_i7.Key? key, required _i9.DiscoveredDevice device})
      : super(DeviceRoute.name,
            path: '/deviceDetail',
            args: DeviceRouteArgs(key: key, device: device));

  static const String name = 'DeviceRoute';
}

class DeviceRouteArgs {
  const DeviceRouteArgs({this.key, required this.device});

  final _i7.Key? key;

  final _i9.DiscoveredDevice device;

  @override
  String toString() {
    return 'DeviceRouteArgs{key: $key, device: $device}';
  }
}
