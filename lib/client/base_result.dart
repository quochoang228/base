import 'package:dio/dio.dart';

sealed class BaseResult<T> with SealedResult<T> {
  bool get isSuccessful => this is Success<T>;

  BaseResult<T> transform({
    required T Function(T)? success,
    BaseError<T> Function(BaseError<T>)? error,
  }) {
    if (this is Success<T> && success != null) {
      (this as Success<T>).data = success.call((this as Success<T>).data);
    }
    if (this is BaseError<T> && error != null) {
      return error.call(this as BaseError<T>);
    }
    return this;
  }

  T? getData(){
    final state = this;
    if(state is Success<T>){
      return state.data;
    } else {
      return null;
    }
  }
}

class Success<T> extends BaseResult<T> {
  T data;

  Success(this.data);
}

class BaseError<T> extends BaseResult<T> {
  DioExceptionType type;
  String message;
  int? statusCode = 0;

  BaseError(this.type, this.message, {this.statusCode});
}

class Loading<T> extends BaseResult<T> {
  Loading();
}

class Init<T> extends BaseResult<T> {
  Init();
}

mixin SealedResult<T> {
  R? when<R>({
    R Function(T)? success,
    R Function(BaseError)? error,
  }) {
    if (this is Success<T>) {
      return success?.call((this as Success).data);
    }
    if (this is BaseError<T>) {
      return error?.call(this as BaseError);
    }
    throw Exception('If you got here, probably you forgot to regenerate the classes? '
        'Try running flutter packages pub run build_runner build');
  }
}
