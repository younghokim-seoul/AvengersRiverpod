import 'package:freezed_annotation/freezed_annotation.dart';

part 'avengers.freezed.dart';
part 'avengers.g.dart';

@freezed
class Avengers with _$Avengers {
  factory Avengers({
    required String id,
    required String name,
    required String token,
    required String color,
    required String quote,
    required String video,
    required String livecid,
    required String poster,
  }) = _Avengers;

  factory Avengers.fromJson(Map<String, dynamic> json) => _$AvengersFromJson(json);



}
