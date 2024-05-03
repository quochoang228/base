import 'package:base/env/env.dart';
import 'package:base/feature/example/data/models/news.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constant/data_state.dart';
import '../../../../di/locator.dart';
import '../../data/repository/example_repository.dart';

final testProvider = StateProvider((ref) => 'testProvider');

final exampleProvider = StateNotifierProvider.autoDispose<ExampleProvider, DataSate<NewsResponse>>(
  (ref) => ExampleProvider(ref),
);

class ExampleProvider extends StateNotifier<DataSate<NewsResponse>> {
  ExampleProvider(this.ref) : super(NotLoaded<NewsResponse>());

  final Ref ref;

  Future getNewsEverything() async {
    if (state.state != State.loading) {
      state = Loading<NewsResponse>();
      try {
        var queryParameters = {
          'apiKey': Env.newsApikey,
          'q': 'Viettel',
          'sortBy': 'popularity',
          'pageSize': 10,
          'language': 'vi',
        };
        final result = await appLocator<ExampleRepository>().getNewsEverything(queryParameters);
        result.when(
          success: (data) {
            if (data.status == 'ok') {
              if (data.totalResults == 0) {
                state = NoData();
              } else {
                state = Fetched(data);
              }
            } else {
              // state = Failed(error);
            }
          },
          error: (err) {
            throw err;
          },
        );
      } catch (error) {
        state = Failed(error);
      }
    }
  }
}
