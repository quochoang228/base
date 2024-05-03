import 'package:base/feature/example/data/models/news.dart';

import '../../../../client/base_repository.dart';
import '../../../../client/base_result.dart';
import '../api/example_api.dart';

abstract class ExampleRepository {
  Future<BaseResult<NewsResponse>> getNewsEverything(Map<String, dynamic> queryParameters);
}

class ExampleRepositoryImpl extends BaseRepository implements ExampleRepository {
  ExampleRepositoryImpl({
    required ExampleApi exampleApi,
  }) : _exampleApi = exampleApi;

  final ExampleApi _exampleApi;

  @override
  Future<BaseResult<NewsResponse>> getNewsEverything(Map<String, dynamic> queryParameters) async {
    try {
      return await safeApiCall(
        _exampleApi.getNewsEverything(queryParameters),
        mapper: (data) => NewsResponse.fromJson(data as Map<String, dynamic>),
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
