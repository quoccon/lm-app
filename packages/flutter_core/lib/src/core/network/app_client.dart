import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../model/models.dart';

abstract class AppClient {
  Stream<bool> get onExpired;

  Future<Either<Failure, Map<String, dynamic>>> call(
    String path, {
    required RestfulMethod method,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  });
}

enum RestfulMethod { get, post, put, patch }

class AppClientImpl extends AppClient {
  final Dio? dio;

  AppClientImpl({this.dio});

  final StreamController<bool> _onTokenExpired = StreamController.broadcast();

  @override
  Stream<bool> get onExpired => _onTokenExpired.stream;

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
    String path, {
    required RestfulMethod method,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    if (dio == null) {
      return const Left(Failure(code: 1000));
    }

    try {
      Response<dynamic>? response;
      if (method == RestfulMethod.get) {
        response = await dio?.get(path, queryParameters: queryParameters);
      } else if (method == RestfulMethod.post) {
        response = await dio?.post(path, data: data);
      } else if (method == RestfulMethod.put) {
        response = await dio?.put(path, data: data);
      } else if (method == RestfulMethod.patch) {
        response = await dio?.patch(path, data: data);
      }
      return _parseResponse(response);
    } on DioException catch (e) {
      if (e.error is SocketException) {
        return const Left(
          Failure(
            code: 500,
            message: 'Đã có lỗi xảy ra, vui lòng thử lại sau.',
          ),
        );
      }
      return _parseResponse(e.response);
    } catch (error) {
      return const Left(
        Failure(code: 500, message: 'Đã có lỗi xảy ra, vui lòng thử lại sau.'),
      );
    }
  }

  Either<Failure, Map<String, dynamic>> _parseResponse(
    Response<dynamic>? response,
  ) {
    if (response == null) {
      return const Left(
        Failure(code: 500, message: 'Đã có lỗi xảy ra, vui lòng thử lại sau.'),
      );
    }
    try {
      final apiData = ApiModel.fromJson(
        (response.data as Map<String, dynamic>?) ?? {},
      );
      if (response.statusCode != 200 && response.statusCode != 201) {
        if (response.statusCode == 403) {
          _onTokenExpired.add(true);
        }
        return Left(Failure(code: response.statusCode, message: apiData.error));
      }

      if (apiData.code != ApiStatus.success.code) {
        return Left(Failure(code: 500, message: apiData.error));
      }

      final Map<String, dynamic> finalResult =
          apiData.data is Map<String, dynamic>?
              ? apiData.data ?? {}
              : {"response": apiData.data};
      return Right(finalResult);
    } catch (e) {
      return const Left(
        Failure(code: 500, message: 'Đã có lỗi xảy ra, vui lòng thử lại sau.'),
      );
    }
  }
}
