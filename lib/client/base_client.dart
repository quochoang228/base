import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../env/env.dart';
import '../logs/log_interceptor.dart';
import '../logs/log_utils.dart';



const uuid = Uuid();

class BaseClient {
  final Dio dio;

  BaseClient({required this.dio}) {
    initConfig();
  }

  Future<void> initConfig() async {
    dio.options = _options;
    dio.interceptors.add(_interceptor);
    if (kDebugMode) {
      dio.interceptors.add(LoggingInterceptor());
    }
  }

  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) =>
      dio.get<T>(
        url,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options : options,
      );

  Future<Response<T>> post<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async =>
      await dio.post<T>(
        url,
        queryParameters: queryParameters,
        data: data,
        cancelToken: cancelToken,
         options : options,
      );

  Future<Response<T>> put<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async =>
      await dio.put<T>(
        url,
        queryParameters: queryParameters,
        data: data,
        cancelToken: cancelToken,
         options : options,
      );

  Future<Response<T>> delete<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
  }) =>
      dio.delete<T>(
        url,
        queryParameters: queryParameters,
        data: data,
        cancelToken: cancelToken,
      );

  static BaseOptions get _options {
    return BaseOptions(
      baseUrl: Env.baseUrl, // TODO : change baseUrl
      receiveDataWhenStatusError: true,
      followRedirects: true,
      maxRedirects: 100,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {

      }
    );
  }

  static QueuedInterceptorsWrapper get _interceptor {
    return QueuedInterceptorsWrapper(
      onRequest: (options, handler) async{

        //TODO : Interceptors on request
        // final localUser = await appLocator<AuthenticationRepository>().localUser;
        //
        // String? deviceId = await AppInfoHelper.getDeviceId();
        //
        // if(localUser.isNotEmpty){
        //   Map<String, dynamic> user = jsonDecode(localUser);
        //   var customHeaders = {
        //     'Authorization': "Bearer ${user["token"]}"
        //     // other headers
        //   };
        //   options.headers.addAll(customHeaders);
        // }
        options.headers.addAll({
          "clientMessageId": uuid.v1(),
        });
        // options.headers.addAll({
        //   "deviceId": deviceId,
        // });
        return handler.next(options);
      },
      onError: (
        DioException e,
        ErrorInterceptorHandler handler,
      ) {
        if (e.response?.isRedirect == true ||
            e.response?.statusCode == HttpStatus.movedPermanently ||
            e.response?.statusCode == HttpStatus.movedTemporarily ||
            e.response?.statusCode == HttpStatus.seeOther ||
            e.response?.statusCode == HttpStatus.temporaryRedirect) {
          handler.next(e);
          return;
        }
        // refresh token
        // if (e.response?.statusCode == 401) {
        //   LogUtils.e(
        //     'Session is outdated, calling update...',
        //     withStackTrace: false,
        //   );
        //   updateTicket();
        // }
        LogUtils.e(
          'Error when requesting ${e.requestOptions.uri} '
          '${e.response?.statusCode}'
          ': ${e.response?.data}',
          withStackTrace: false,
        );
        handler.reject(e);
      },
    );
  }
}
