import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_sample/app_config.dart';
import 'package:riverpod_sample/data/network/model/avengers/avengers.dart';
import 'package:riverpod_sample/main.dart';

part 'avengers_api_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class AvengersApiClient {
  factory AvengersApiClient(
    Dio dio, {
    String baseUrl,
  }) = _AvengersApiClient;

  @GET("/Avengers.json")
  Future<String> fetchAvengers();
}
