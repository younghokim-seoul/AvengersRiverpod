// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'avengers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Avengers _$AvengersFromJson(Map<String, dynamic> json) {
  return _Avengers.fromJson(json);
}

/// @nodoc
mixin _$Avengers {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get quote => throw _privateConstructorUsedError;
  String get video => throw _privateConstructorUsedError;
  String get livecid => throw _privateConstructorUsedError;
  String get poster => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvengersCopyWith<Avengers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvengersCopyWith<$Res> {
  factory $AvengersCopyWith(Avengers value, $Res Function(Avengers) then) =
      _$AvengersCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String token,
      String color,
      String quote,
      String video,
      String livecid,
      String poster});
}

/// @nodoc
class _$AvengersCopyWithImpl<$Res> implements $AvengersCopyWith<$Res> {
  _$AvengersCopyWithImpl(this._value, this._then);

  final Avengers _value;
  // ignore: unused_field
  final $Res Function(Avengers) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? token = freezed,
    Object? color = freezed,
    Object? quote = freezed,
    Object? video = freezed,
    Object? livecid = freezed,
    Object? poster = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      quote: quote == freezed
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
      livecid: livecid == freezed
          ? _value.livecid
          : livecid // ignore: cast_nullable_to_non_nullable
              as String,
      poster: poster == freezed
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AvengersCopyWith<$Res> implements $AvengersCopyWith<$Res> {
  factory _$$_AvengersCopyWith(
          _$_Avengers value, $Res Function(_$_Avengers) then) =
      __$$_AvengersCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String token,
      String color,
      String quote,
      String video,
      String livecid,
      String poster});
}

/// @nodoc
class __$$_AvengersCopyWithImpl<$Res> extends _$AvengersCopyWithImpl<$Res>
    implements _$$_AvengersCopyWith<$Res> {
  __$$_AvengersCopyWithImpl(
      _$_Avengers _value, $Res Function(_$_Avengers) _then)
      : super(_value, (v) => _then(v as _$_Avengers));

  @override
  _$_Avengers get _value => super._value as _$_Avengers;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? token = freezed,
    Object? color = freezed,
    Object? quote = freezed,
    Object? video = freezed,
    Object? livecid = freezed,
    Object? poster = freezed,
  }) {
    return _then(_$_Avengers(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      quote: quote == freezed
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      video: video == freezed
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String,
      livecid: livecid == freezed
          ? _value.livecid
          : livecid // ignore: cast_nullable_to_non_nullable
              as String,
      poster: poster == freezed
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Avengers implements _Avengers {
  _$_Avengers(
      {required this.id,
      required this.name,
      required this.token,
      required this.color,
      required this.quote,
      required this.video,
      required this.livecid,
      required this.poster});

  factory _$_Avengers.fromJson(Map<String, dynamic> json) =>
      _$$_AvengersFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String token;
  @override
  final String color;
  @override
  final String quote;
  @override
  final String video;
  @override
  final String livecid;
  @override
  final String poster;

  @override
  String toString() {
    return 'Avengers(id: $id, name: $name, token: $token, color: $color, quote: $quote, video: $video, livecid: $livecid, poster: $poster)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Avengers &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.quote, quote) &&
            const DeepCollectionEquality().equals(other.video, video) &&
            const DeepCollectionEquality().equals(other.livecid, livecid) &&
            const DeepCollectionEquality().equals(other.poster, poster));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(quote),
      const DeepCollectionEquality().hash(video),
      const DeepCollectionEquality().hash(livecid),
      const DeepCollectionEquality().hash(poster));

  @JsonKey(ignore: true)
  @override
  _$$_AvengersCopyWith<_$_Avengers> get copyWith =>
      __$$_AvengersCopyWithImpl<_$_Avengers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AvengersToJson(this);
  }
}

abstract class _Avengers implements Avengers {
  factory _Avengers(
      {required final String id,
      required final String name,
      required final String token,
      required final String color,
      required final String quote,
      required final String video,
      required final String livecid,
      required final String poster}) = _$_Avengers;

  factory _Avengers.fromJson(Map<String, dynamic> json) = _$_Avengers.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get token => throw _privateConstructorUsedError;
  @override
  String get color => throw _privateConstructorUsedError;
  @override
  String get quote => throw _privateConstructorUsedError;
  @override
  String get video => throw _privateConstructorUsedError;
  @override
  String get livecid => throw _privateConstructorUsedError;
  @override
  String get poster => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AvengersCopyWith<_$_Avengers> get copyWith =>
      throw _privateConstructorUsedError;
}
