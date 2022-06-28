// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'what_ever.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Whatever _$WhateverFromJson(Map<String, dynamic> json) {
  return _Whatever.fromJson(json);
}

/// @nodoc
mixin _$Whatever {
  List<Avengers> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WhateverCopyWith<Whatever> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhateverCopyWith<$Res> {
  factory $WhateverCopyWith(Whatever value, $Res Function(Whatever) then) =
      _$WhateverCopyWithImpl<$Res>;
  $Res call({List<Avengers> data});
}

/// @nodoc
class _$WhateverCopyWithImpl<$Res> implements $WhateverCopyWith<$Res> {
  _$WhateverCopyWithImpl(this._value, this._then);

  final Whatever _value;
  // ignore: unused_field
  final $Res Function(Whatever) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Avengers>,
    ));
  }
}

/// @nodoc
abstract class _$$_WhateverCopyWith<$Res> implements $WhateverCopyWith<$Res> {
  factory _$$_WhateverCopyWith(
          _$_Whatever value, $Res Function(_$_Whatever) then) =
      __$$_WhateverCopyWithImpl<$Res>;
  @override
  $Res call({List<Avengers> data});
}

/// @nodoc
class __$$_WhateverCopyWithImpl<$Res> extends _$WhateverCopyWithImpl<$Res>
    implements _$$_WhateverCopyWith<$Res> {
  __$$_WhateverCopyWithImpl(
      _$_Whatever _value, $Res Function(_$_Whatever) _then)
      : super(_value, (v) => _then(v as _$_Whatever));

  @override
  _$_Whatever get _value => super._value as _$_Whatever;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_Whatever(
      data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Avengers>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Whatever implements _Whatever {
  _$_Whatever(final List<Avengers> data) : _data = data;

  factory _$_Whatever.fromJson(Map<String, dynamic> json) =>
      _$$_WhateverFromJson(json);

  final List<Avengers> _data;
  @override
  List<Avengers> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'Whatever(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Whatever &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  _$$_WhateverCopyWith<_$_Whatever> get copyWith =>
      __$$_WhateverCopyWithImpl<_$_Whatever>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WhateverToJson(this);
  }
}

abstract class _Whatever implements Whatever {
  factory _Whatever(final List<Avengers> data) = _$_Whatever;

  factory _Whatever.fromJson(Map<String, dynamic> json) = _$_Whatever.fromJson;

  @override
  List<Avengers> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WhateverCopyWith<_$_Whatever> get copyWith =>
      throw _privateConstructorUsedError;
}
