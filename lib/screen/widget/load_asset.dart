import 'package:flutter/material.dart';

Widget loadAsset(
  String asset, {
  double? height,
  double? width,
  Color? color,
}) {
  return Image.asset(
    asset,
    width: width,
    height: height,
  );
}
