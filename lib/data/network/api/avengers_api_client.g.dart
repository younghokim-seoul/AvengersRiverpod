// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avengers_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _AvengersApiClient implements AvengersApiClient {
  _AvengersApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??=
        'https://gist.githubusercontent.com/skydoves/933a70b21d7c96e8a8fdbe31ca72dada/raw/454f107f2c5f32c13823f7a6fd5031900f280d7c/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<String> fetchAvengers() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/Avengers.json',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
