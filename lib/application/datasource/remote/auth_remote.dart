import 'package:dartz/dartz.dart';
import 'package:flutter_cors/flutter_core.dart';

import '../../../constants/constants.dart';
import '../model/sport_preferences_model.dart';
import '../model/user_model.dart';

abstract class AuthRemote {
  Future<Either<Failure, UserResponse?>> loginWithEmailAndPass({
    required String email,
    required String password,
    required bool isRemember,
  });

  Future<Either<Failure, dynamic>> register({
    required String username,
    required String email,
    required String gender,
    required String password,
  });

  Future<Either<Failure, dynamic>> verifyOtp({
    required String email,
    required int otp,
  });

  Future<Either<Failure, List<SportPreferences>?>> listSuggestion();
}

class AuthRemoteImpl implements AuthRemote {
  final AppClient _appClient;

  const AuthRemoteImpl(this._appClient);

  @override
  Future<Either<Failure, UserResponse?>> loginWithEmailAndPass({
    required String email,
    required String password,
    required bool isRemember,
  }) async {
    final body = <String, dynamic>{
      'email': email,
      'password': password,
      'remember': isRemember,
    };
    final result = await _appClient.call(
      ApiPath.loginWithEmailAndPass,
      method: RestfulMethod.post,
      data: body,
    );

    return result.fold(
      (error) {
        return Left(error);
      },
      (success) {
        return Right(UserResponse.fromJson(success));
      },
    );
  }

  @override
  Future<Either<Failure, dynamic>> register({
    required String username,
    required String email,
    required String gender,
    required String password,
  }) async {
    final data = <String, dynamic>{
      'username': username,
      'email': email,
      'gender': gender,
      'password': password,
    };

    final result = await _appClient.call(
      ApiPath.register,
      method: RestfulMethod.post,
      data: data,
    );

    return result;
  }

  @override
  Future<Either<Failure, dynamic>> verifyOtp({
    required String email,
    required int otp,
  }) async {
    final data = <String, dynamic>{'email': email, 'otp': otp};
    final result = await _appClient.call(
      ApiPath.verifyOtp,
      method: RestfulMethod.post,
      data: data,
    );
    return result;
  }

  @override
  Future<Either<Failure, List<SportPreferences>?>> listSuggestion() async {
    final result = await _appClient.call(
      ApiPath.listSuggest,
      method: RestfulMethod.get,
    );
    return result.fold(
      (error) {
        return Left(error);
      },
      (success) {
        print('success1: $success');
        return Right(SportPreferencesResponse.fromJson(success).response);
      },
    );
  }
}
