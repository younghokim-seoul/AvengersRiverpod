// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'what_ever.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Whatever _$$_WhateverFromJson(Map<String, dynamic> json) => _$_Whatever(
      (json['data'] as List<dynamic>)
          .map((e) => Avengers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WhateverToJson(_$_Whatever instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
