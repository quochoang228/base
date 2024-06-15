sealed class DataSate<T> {
  DataSate({required this.state, this.error, this.valueOrNull});

  T? valueOrNull;
  Object? error;
  State state;

  T get value => valueOrNull!;

  R onState<R>({
    required R Function() notLoaded,
    required R Function() loading,
    required R Function(T data) fetched,
    required R Function() noData,
    required R Function(Object error) failed,
  }) {
    if (state.isNotLoaded) {
      return notLoaded();
    } else if (state.isLoading) {
      return loading();
    } else if (state.isFetched) {
      return fetched(valueOrNull as T);
    }  else if (state.isNoData) {
      return noData();
    } else {
      return failed(error!);
    }
  }
}

class NotLoaded<T> extends DataSate<T> {
  NotLoaded() : super(state: State.notLoaded);
}

class Loading<T> extends DataSate<T> {
  Loading() : super(state: State.loading);
}

class Fetched<T> extends DataSate<T> {
  final T data;

  Fetched(this.data) : super(state: State.fetched, valueOrNull: data);
}

class NoData<T> extends DataSate<T> {
  NoData() : super(state: State.noData);
}

class Failed<T> extends DataSate<T> {
  final Object err;

  Failed(this.err) : super(state: State.failed, error: err);
}

enum State {
  notLoaded,
  loading,
  fetched,
  noData,
  failed;

  bool get isNotLoaded => this == State.notLoaded;

  bool get isLoading => this == State.loading;

  bool get isFetched => this == State.fetched;

  bool get isNoData => this == State.noData;

  bool get isFailed => this == State.failed;
}
