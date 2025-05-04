import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/application/datasource/model/challenge_model.dart';
import 'package:lifemap/application/datasource/remote/challenge_remote.dart';

part 'challenge_state.dart';

class ChallengeCubit extends BaseCubit<ChallengeState> {
  ChallengeCubit(this._challengeRemote) : super(ChallengeState());

  final ChallengeRemote _challengeRemote;

  void saveArg(int? status) {
    emit(state.copyWith(status: status));
  }

  Future getChallengeByMe() async {
    final status = state.status;
    emit(state.copyWith(loading: true));
    final result = await _challengeRemote.getChallengeByMe(status: status ?? 1);
    result.fold(
      (error) {
        emit(state.copyWith(loading: false, error: error.message));
      },
      (success) {
        emit(
          state.copyWith(
            loading: false,
            data: success?.challenges,
            totalChallenge: success?.totalChallenges,
          ),
        );
      },
    );
  }
}
