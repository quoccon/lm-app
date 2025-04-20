import 'package:dartz/dartz.dart';
import 'package:flutter_cors/flutter_core.dart';

import '../../../constants/constants.dart';
import '../model/user_model.dart';


abstract class AuthRemote {
  Future<Either<Failure, UserResponse?>> loginWithEmailAndPass({
    required String email,
    required String password,
    required bool isRemember,
  });
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

    return result.fold((error){
      return Left(error);
    }, (success){
      return Right(UserResponse.fromJson(success));
    },);
  }
}
