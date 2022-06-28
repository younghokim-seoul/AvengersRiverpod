import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/data/network/api/avengers_api_client.dart';
import 'package:riverpod_sample/data/network/dio_provider.dart';

final avengersProvider = Provider<AvengersApiClient>((ref) {
  final dio = ref.watch(dioProvider);
  return AvengersApiClient(dio);
});
