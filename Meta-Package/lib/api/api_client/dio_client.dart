import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:meta_package/api/api_client/api_exception.dart';
import 'package:meta_package/api/services/local_store_service.dart';
import 'package:sentry_dio/sentry_dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class DioClient {
  String _baseUrl = '';

  late Dio dio;

  static DioClient get client => _singleton;

  static final DioClient _singleton = DioClient._internal();

  factory DioClient() {
    return _singleton;
  }

  DioClient._internal();

  void setBaseUrl(String url) {
    _baseUrl = url;
    dio = DioInterceptor(baseUrl: url).dio;
  }

  Future<Response<T>> callRequest<T>(
      {required String endPoint, required Options options, dynamic body}) {
    try {
      RequestOptions optData = RequestOptions(path: endPoint)
        ..method = options.method!
        ..data = body
        ..responseType = ResponseType.json;

      if (options.headers != null) {
        optData.headers = options.headers!;
      }

      return dio.fetch<T>(optData);
    } on DioError catch (e) {
      throw ApiException(message: e.message, error: e);
    } catch (e) {
      throw ApiException(message: e.toString(), error: e);
    }
  }

  Future<Response<T>> getClient<T>(String method, String endPoint,
      {bool token = true,
      Map<String, dynamic>? additionalHeaders,
      dynamic body}) async {
    Map<String, dynamic> headers = {
      "Content-type": "application/json",
    };

    if (LocalStore.localStore.customerToken.isEmpty) {
      await LocalStore.localStore.getToken();
    }
    if (token && LocalStore.localStore.customerToken.isNotEmpty) {
      headers['Authorization'] = LocalStore.localStore.customerToken;
    }

    if (additionalHeaders != null && additionalHeaders.isNotEmpty) {
      headers.addAll(additionalHeaders);
    }

    Options options = Options()
      ..method = method
      ..headers = headers
      ..responseType = ResponseType.json;

    return callRequest<T>(endPoint: endPoint, options: options, body: body);
  }

  Future<Response<T>> getClientWithoutHeader<T>(String method, String endPoint,
      {dynamic body}) async {
    Options options = Options()..method = method;
    return callRequest<T>(endPoint: endPoint, options: options, body: body);
  }

  Future<Response<T>> getClientWithOutToken<T>(String method, String endPoint,
      {Map<String, dynamic>? additionalHeaders, dynamic body}) async {
    Map<String, dynamic> headers = {
      "Content-type": "application/json",
    };

    if (additionalHeaders != null && additionalHeaders.isNotEmpty) {
      headers.addAll(additionalHeaders);
    }

    Options options = Options()
      ..method = method
      ..headers = headers;
    return callRequest<T>(endPoint: endPoint, options: options, body: body);
  }

  Future<http.Response> getMultipartClient(String method, String endPoint,
      {Map<String, String>? data}) async {
    SentryHttpClient client = SentryHttpClient(networkTracing: true);
    ISentrySpan? transaction;
    if (!kDebugMode) {
      // record when app is in release mode
      transaction = Sentry.startTransaction(
        getSentryTransactionName(_baseUrl),
        'request',
        bindToScope: true,
      );
    }
    var request = http.MultipartRequest(method, Uri.parse(endPoint));
    if (data?.isNotEmpty == true) {
      request.fields.addAll(data!);
    }
    http.StreamedResponse response;
    try {
      response =
          await client.send(request).timeout(const Duration(seconds: 60));
    } finally {
      client.close();
    }

    if (!kDebugMode) {
      await transaction?.finish(
          status: SpanStatus.fromHttpStatusCode(response.statusCode));
    }

    log("response -> $response");
    return http.Response.fromStream(response);
  }
}

String getSentryTransactionName(String baseUrl) {
  if (baseUrl.toLowerCase().contains('sololuxury')) {
    return 'solo-luxury-api-request';
  } else if (baseUrl.toLowerCase().contains('veralusso')) {
    return 'veralusso-api-request';
  } else if (baseUrl.toLowerCase().contains('brands-labels')) {
    return 'brands-labels-api-request';
  } else if (baseUrl.toLowerCase().contains('suvandnat')) {
    return 'suvandnat-api-request';
  } else if (baseUrl.toLowerCase().contains('avoir-chic')) {
    return 'avoir-chic-api-request';
  } else {
    return "common";
  }
}

class DioInterceptor {
  late Dio dio;
  late RequestOptions requestOptions;

  DioInterceptor({required String baseUrl}) {
    dio = Dio();

    if (!kDebugMode) {
      // record when app is in release mode
      dio.addSentry(
          captureFailedRequests: true,
          maxRequestBodySize: MaxRequestBodySize.always,
          maxResponseBodySize: MaxResponseBodySize.always);
    }

    ISentrySpan? transaction;

    final stopWatch = Stopwatch();
    // int endTime = 0;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, requestHandler) async {
          requestOptions = options;
          stopWatch.start();

          if (!kDebugMode) {
            // record when app is in release mode
            transaction = Sentry.startTransaction(
              getSentryTransactionName(baseUrl),
              'request',
              description: '${options.method} ${options.path}',
              bindToScope: true,
            );
          }

          log("URL => ${options.path}  || elapsedMilliseconds => ${stopWatch.elapsedMilliseconds}",
              name: 'InterceptorsWrapper onRequest');
          log(options.method, name: 'InterceptorsWrapper Type');
          log(options.headers.toString(), name: 'InterceptorsWrapper Header');
          log(options.data.toString(), name: 'InterceptorsWrapper Data');
          requestHandler.next(options);
        },
        onError: (
          DioError e,
          ErrorInterceptorHandler handler,
        ) async {
          stopWatch.stop();
          // endTime = stopWatch.elapsedMilliseconds;
          // updateLog(e.response?.statusCode, e.response?.data, endTime: endTime);
          log("${e.response} || elapsedMilliseconds => ${stopWatch.elapsedMilliseconds}",
              name: ' onError');

          if (!kDebugMode) {
            // record when app is in release mode
            // added sentry transaction
            transaction?.throwable = e;
            transaction?.status = const SpanStatus.internalError();

            await transaction?.finish();
          }

          handler.reject(e);
        },
        onResponse: (
          Response e,
          ResponseInterceptorHandler handler,
        ) async {
          stopWatch.stop();
          log("elapsedMilliseconds => ${stopWatch.elapsedMilliseconds}",
              name: 'InterceptorsWrapper onResponse');

          // endTime = stopWatch.elapsedMilliseconds;
          // updateLog(e.statusCode, e.data, endTime: endTime);

          if (!kDebugMode) {
            // record when app is in release mode
            // added sentry transaction
            transaction?.status =
                SpanStatus.fromHttpStatusCode(e.statusCode ?? -1);

            await transaction?.finish();
          }

          handler.next(e);
        },
      ),
    );
  }
}
