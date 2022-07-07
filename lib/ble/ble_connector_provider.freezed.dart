// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ble_connector_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectorState {
  ConnectionStateUpdate get connectionStateUpdate =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectorStateCopyWith<ConnectorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectorStateCopyWith<$Res> {
  factory $ConnectorStateCopyWith(
          ConnectorState value, $Res Function(ConnectorState) then) =
      _$ConnectorStateCopyWithImpl<$Res>;
  $Res call({ConnectionStateUpdate connectionStateUpdate});
}

/// @nodoc
class _$ConnectorStateCopyWithImpl<$Res>
    implements $ConnectorStateCopyWith<$Res> {
  _$ConnectorStateCopyWithImpl(this._value, this._then);

  final ConnectorState _value;
  // ignore: unused_field
  final $Res Function(ConnectorState) _then;

  @override
  $Res call({
    Object? connectionStateUpdate = freezed,
  }) {
    return _then(_value.copyWith(
      connectionStateUpdate: connectionStateUpdate == freezed
          ? _value.connectionStateUpdate
          : connectionStateUpdate // ignore: cast_nullable_to_non_nullable
              as ConnectionStateUpdate,
    ));
  }
}

/// @nodoc
abstract class _$$_ConnectorStateCopyWith<$Res>
    implements $ConnectorStateCopyWith<$Res> {
  factory _$$_ConnectorStateCopyWith(
          _$_ConnectorState value, $Res Function(_$_ConnectorState) then) =
      __$$_ConnectorStateCopyWithImpl<$Res>;
  @override
  $Res call({ConnectionStateUpdate connectionStateUpdate});
}

/// @nodoc
class __$$_ConnectorStateCopyWithImpl<$Res>
    extends _$ConnectorStateCopyWithImpl<$Res>
    implements _$$_ConnectorStateCopyWith<$Res> {
  __$$_ConnectorStateCopyWithImpl(
      _$_ConnectorState _value, $Res Function(_$_ConnectorState) _then)
      : super(_value, (v) => _then(v as _$_ConnectorState));

  @override
  _$_ConnectorState get _value => super._value as _$_ConnectorState;

  @override
  $Res call({
    Object? connectionStateUpdate = freezed,
  }) {
    return _then(_$_ConnectorState(
      connectionStateUpdate: connectionStateUpdate == freezed
          ? _value.connectionStateUpdate
          : connectionStateUpdate // ignore: cast_nullable_to_non_nullable
              as ConnectionStateUpdate,
    ));
  }
}

/// @nodoc

class _$_ConnectorState implements _ConnectorState {
  _$_ConnectorState({required this.connectionStateUpdate});

  @override
  final ConnectionStateUpdate connectionStateUpdate;

  @override
  String toString() {
    return 'ConnectorState(connectionStateUpdate: $connectionStateUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectorState &&
            const DeepCollectionEquality()
                .equals(other.connectionStateUpdate, connectionStateUpdate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(connectionStateUpdate));

  @JsonKey(ignore: true)
  @override
  _$$_ConnectorStateCopyWith<_$_ConnectorState> get copyWith =>
      __$$_ConnectorStateCopyWithImpl<_$_ConnectorState>(this, _$identity);
}

abstract class _ConnectorState implements ConnectorState {
  factory _ConnectorState(
          {required final ConnectionStateUpdate connectionStateUpdate}) =
      _$_ConnectorState;

  @override
  ConnectionStateUpdate get connectionStateUpdate =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectorStateCopyWith<_$_ConnectorState> get copyWith =>
      throw _privateConstructorUsedError;
}
