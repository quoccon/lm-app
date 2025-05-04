import 'package:dartz/dartz.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/application/datasource/model/challenge_model.dart';
import 'package:lifemap/constants/api_paths.dart';

abstract class ChallengeRemote {
  Future<Either<Failure, ChallengeResponse?>> getChallengeByMe({
    required int status,
  });

  Future<Either<Failure, ChallengeModel?>> addChallenge({
    required String challengeName,
    required String sportType,
    required String goal,
    required String startDate,
    required String endDate,
  });
}

class ChallengeRemoteImpl implements ChallengeRemote {
  final AppClient _appClient;

  const ChallengeRemoteImpl(this._appClient);

  @override
  Future<Either<Failure, ChallengeResponse?>> getChallengeByMe({
    required int status,
  }) async {
    final query = <String, dynamic>{'status': status};
    final result = await _appClient.call(
      ApiPath.listChallengeByMe,
      method: RestfulMethod.get,
      queryParameters: query,
    );
    return result.fold(
      (error) {
        return Left(error);
      },
      (success) {
        return Right(ChallengeResponse.fromJson(success));
      },
    );
  }

  @override
  Future<Either<Failure, ChallengeModel?>> addChallenge({
    required String challengeName,
    required String sportType,
    required String goal,
    required String startDate,
    required String endDate,
  }) async {
    final data = <String, dynamic>{
      'challenge_name': challengeName,
      'sport_type': sportType,
      'goal': goal,
      'start_date': startDate,
      'end_date': endDate,
    };

    final result = await _appClient.call(
      ApiPath.addChallenge,
      method: RestfulMethod.post,
      data: data,
    );

    return result.fold(
      (error) {
        return Left(error);
      },
      (success) {
        return Right(ChallengeModel.fromJson(success));
      },
    );
  }
}
