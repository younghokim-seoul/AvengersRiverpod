import 'package:flutter/material.dart';
import 'package:riverpod_sample/resources/resources.dart';

abstract class AppStyles{
  static const bold24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.16,
  );
  static const bold32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.16,
  );

  static const bold36 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.16,
  );

  static const bold19 = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.16,
  );

  static const regular12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.gray0,
    letterSpacing: -0.12,
  );

  static BoxDecoration containerDecoration({
    double radius = 16,
    Color? color,
    List<BoxShadow>? boxShadow,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: color ?? AppColors.gray1,
      boxShadow: boxShadow,
    );
  }
}