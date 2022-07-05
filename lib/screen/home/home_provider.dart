import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/data/network/model/avengers/avengers.dart';
import 'package:riverpod_sample/data/network/repository/avengers_repository.dart';

final avengersListProvider = FutureProvider.autoDispose<List<Avengers>>((ref) async {
  final avengersRepository = ref.watch(avengersRepositoryProvider);
  final avengers = await avengersRepository.fetchAvengers();
  List<dynamic> parsedJson = jsonDecode(avengers);
  var value = parsedJson.map((dynamic i) => Avengers.fromJson(i as Map<String, dynamic>)).toList();
  return value;
});

