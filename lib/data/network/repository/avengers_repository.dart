import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/data/network/api/avengers_api_client.dart';
import 'package:riverpod_sample/data/network/api_client_provider.dart';
import 'package:riverpod_sample/data/network/model/avengers/avengers.dart';


final avengersRepositoryProvider = Provider<AvengersRepository>((ref) {
  final avengersApi = ref.watch(avengersProvider);
  return AvengersRepository(avengersApi: avengersApi);
});

class AvengersRepository {
  final AvengersApiClient avengersApi;

  const AvengersRepository({required this.avengersApi});

  Future<String> fetchAvengers() => avengersApi.fetchAvengers();
}
