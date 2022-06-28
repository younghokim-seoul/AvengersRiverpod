import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_sample/data/network/model/avengers/avengers.dart';

part 'what_ever.freezed.dart';
part 'what_ever.g.dart';

@freezed
abstract class Whatever with _$Whatever {
  factory Whatever(List<Avengers> data) = _Whatever;

  factory Whatever.fromJson(Map<String, dynamic> json) => _$WhateverFromJson(json);
}