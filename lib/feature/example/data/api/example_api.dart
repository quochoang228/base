import 'package:dio/dio.dart';

import '../../../../client/base_client.dart';

abstract class ExampleApi {

  Future<Response> getNewsEverything(Map<String, dynamic> queryParameters);
}

class ExampleApiImpl implements ExampleApi {
  final BaseClient _baseClient;

  ExampleApiImpl({
    required BaseClient baseClient,
  }) : _baseClient = baseClient;

  @override
  Future<Response> getNewsEverything(Map<String, dynamic> queryParameters) {
    return _baseClient.get(
      '/everything',
      queryParameters: queryParameters,
    );
  }
}
