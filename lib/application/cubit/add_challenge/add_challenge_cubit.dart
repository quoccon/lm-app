import 'package:flutter_cors/flutter_core.dart';

import '../../datasource/model/model.dart';
import '../../datasource/remote/remote.dart';

part 'add_challenge_state.dart';

class AddChallengeCubit extends BaseCubit<AddChallengeState> {
  AddChallengeCubit(this._challengeRemote, this._authRemote)
    : super(AddChallengeState());

  final ChallengeRemote _challengeRemote;
  final AuthRemote _authRemote;

  void changeName(String? challengeName) {
    emit(state.copyWith(challengeName: challengeName));
  }

  void changeSportType(SportPreferences? sportType) {
    emit(state.copyWith(sportType: sportType));
  }

  void changeGoal(String? goal) {
    emit(state.copyWith(goal: goal));
  }

  void changeStartDate(String? startDate) {
    emit(state.copyWith(startDate: startDate));
  }

  void changeEndDate(String? endDate) {
    emit(state.copyWith(endDate: endDate));
  }

  Future addChallenge() async {
    emit(state.copyWith(isLoading: true));

    final challengeName = state.challengeName;
    final sportType = state.sportType?.suggestName;
    final goal = state.goal;
    final startDate = state.startDate;
    final endDate = state.endDate;

    final result = await _challengeRemote.addChallenge(
      challengeName: challengeName ?? '',
      sportType: sportType ?? '',
      goal: goal ?? '',
      startDate: startDate ?? '',
      endDate: endDate ?? '',
    );

    result.fold(
      (error) {
        emit(state.copyWith(isLoading: false, error: error.message));
      },
      (success) {
        emit(state.copyWith(isLoading: false, challenge: success));
      },
    );
  }

  Future listSuggestion() async {
    final result = await _authRemote.listSuggestion();
    result.fold(
      (error) {
        emit(state.copyWith(error: error.message));
      },
      (success) {
        print('suggestion: $success');

        emit(state.copyWith(suggestion: success));
      },
    );
  }
}
