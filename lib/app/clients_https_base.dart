// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart' hide LogInterceptor;

abstract class ClientHttpsBase {
  final Dio _dio;

  ClientHttpsBase(
    BaseOptions baseOptions, {
    List<Interceptor>? interceptors,
    HttpClientAdapter? httpClientAdapter,
  }) : _dio = Dio(
          baseOptions,
        ) {
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }

    if (httpClientAdapter != null) {
      _dio.httpClientAdapter = httpClientAdapter;
    }
  }

  get httpsClientAdapter => _dio.httpClientAdapter;

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      final message = _getMessage(e);

      throw Exception(
        message,
      );
    }
  }

  Future<Response<T>> fetch<T>(RequestOptions requestOptions) async {
    try {
      return await _dio.fetch(requestOptions);
    } on DioError catch (e) {
      final message = _getMessage(e);

      throw Exception(
        message,
      );
    }
  }

  Future<Response<T>> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (e) {
      final message = _getMessage(e);

      throw Exception(
        message,
      );
    }
  }

  Future<Response<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        options: options,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (e) {
      final message = _getMessage(e);

      throw Exception(
        message,
      );
    }
  }

  Future<Response<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      return await _dio.put(
        path,
        data: data,
        options: options,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioError catch (e) {
      final message = _getMessage(e);

      throw Exception(
        message,
      );
    }
  }

  Future<Response<T>> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      final message = _getMessage(e);

      throw Exception(
        message,
      );
    }
  }

  get options => _dio.options;

  String _getMessage(DioError e) {
    var d = e.response?.data;

    if (d is Map && (d).containsKey('message') && d['message'] is String) {
      return d['message'];
    }

    if (e.error != null &&
        e.error is Map &&
        (e.error).containsKey('message') &&
        (e.error)['message'] is Map &&
        ((e.error)['message'] as Map)['message'] is String) {
      return ((e.error)['message'] as Map)['message'];
    }

    if (d is Map && (d).containsKey('message') && d['message'] is Map) {
      if (d['message'].containsKey('title') &&
          d['message']['title'] is String) {
        return d['message']['title'];
      }
      return '';
    }

    return e.error;
  }
}
