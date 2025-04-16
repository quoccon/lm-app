import 'dart:convert';
import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppLogInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      developer.log('---------------------------------------------------');
      developer.log(
          'REQUEST[${options.method}] => PATH:${options.baseUrl}${options.path}');
      developer.log('headers :\n${json.encode(options.headers)}');

      if (options.data != null && options.data is Map) {
        developer.log('data:\n${json.encode(options.data)}');
      }

      if (options.queryParameters.isNotEmpty) {
        developer
            .log('queryParameters :\n${json.encode(options.queryParameters)}');
      }
      developer.log('---------------------------------------------------');
    }

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (kDebugMode) {
      developer.log('---------------------------------------------------');
      developer.log(
          'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      if (response.data != null && response.data is Map) {
        developer.log('data: \n${json.encode(response.data)}');
        developer
            .log('statusMessage: \n${json.encode(response.statusMessage)}');
      }
      developer.log('---------------------------------------------------');
    }

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      developer.log(
          'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
      if (err.response?.data is Map) {
        developer.log(json.encode(err.response?.data));
        developer.log(json.encode(err.response?.statusMessage));
      }
    }

    return super.onError(err, handler);
  }
}
