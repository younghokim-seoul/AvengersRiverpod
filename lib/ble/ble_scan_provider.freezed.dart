// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ble_scan_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BleScannerState {
  List<DiscoveredDevice> get discoveredDevices =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BleScannerStateCopyWith<BleScannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BleScannerStateCopyWith<$Res> {
  factory $BleScannerStateCopyWith(
          BleScannerState value, $Res Function(BleScannerState) then) =
      _$BleScannerStateCopyWithImpl<$Res>;
  $Res call({List<DiscoveredDevice> discoveredDevices});
}

/// @nodoc
class _$BleScannerStateCopyWithImpl<$Res>
    implements $BleScannerStateCopyWith<$Res> {
  _$BleScannerStateCopyWithImpl(this._value, this._then);

  final BleScannerState _value;
  // ignore: unused_field
  final $Res Function(BleScannerState) _then;

  @override
  $Res call({
    Object? discoveredDevices = freezed,
  }) {
    return _then(_value.copyWith(
      discoveredDevices: discoveredDevices == freezed
          ? _value.discoveredDevices
          : discoveredDevices // ignore: cast_nullable_to_non_nullable
              as List<DiscoveredDevice>,
    ));
  }
}

/// @nodoc
abstract class _$$_BleScannerStateCopyWith<$Res>
    implements $BleScannerStateCopyWith<$Res> {
  factory _$$_BleScannerStateCopyWith(
          _$_BleScannerState value, $Res Function(_$_BleScannerState) then) =
      __$$_BleScannerStateCopyWithImpl<$Res>;
  @override
  $Res call({List<DiscoveredDevice> discoveredDevices});
}

/// @nodoc
class __$$_BleScannerStateCopyWithImpl<$Res>
    extends _$BleScannerStateCopyWithImpl<$Res>
    implements _$$_BleScannerStateCopyWith<$Res> {
  __$$_BleScannerStateCopyWithImpl(
      _$_BleScannerState _value, $Res Function(_$_BleScannerState) _then)
      : super(_value, (v) => _then(v as _$_BleScannerState));

  @override
  _$_BleScannerState get _value => super._value as _$_BleScannerState;

  @override
  $Res call({
    Object? discoveredDevices = freezed,
  }) {
    return _then(_$_BleScannerState(
      discoveredDevices: discoveredDevices == freezed
          ? _value._discoveredDevices
          : discoveredDevices // ignore: cast_nullable_to_non_nullable
              as List<DiscoveredDevice>,
    ));
  }
}

/// @nodoc

class _$_BleScannerState implements _BleScannerState {
  _$_BleScannerState({required final List<DiscoveredDevice> discoveredDevices})
      : _discoveredDevices = discoveredDevices;

  final List<DiscoveredDevice> _discoveredDevices;
  @override
  List<DiscoveredDevice> get discoveredDevices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discoveredDevices);
  }

  @override
  String toString() {
    return 'BleScannerState(discoveredDevices: $discoveredDevices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BleScannerState &&
            const DeepCollectionEquality()
                .equals(other._discoveredDevices, _discoveredDevices));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_discoveredDevices));

  @JsonKey(ignore: true)
  @override
  _$$_BleScannerStateCopyWith<_$_BleScannerState> get copyWith =>
      __$$_BleScannerStateCopyWithImpl<_$_BleScannerState>(this, _$identity);
}

abstract class _BleScannerState implements BleScannerState {
  factory _BleScannerState(
          {required final List<DiscoveredDevice> discoveredDevices}) =
      _$_BleScannerState;

  @override
  List<DiscoveredDevice> get discoveredDevices =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BleScannerStateCopyWith<_$_BleScannerState> get copyWith =>
      throw _privateConstructorUsedError;
}
