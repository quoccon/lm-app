part of 'add_challenge_cubit.dart';

class AddChallengeState extends BaseState {
  final ChallengeModel? challenge;
  final String? challengeName;
  final String? goal;
  final String? startDate;
  final String? endDate;
  final List<SportPreferences>? suggestion;
  final SportPreferences? sportType;

  const AddChallengeState({
    this.challenge,
    super.error,
    super.isLoading,
    super.isSuccess,
    this.challengeName,
    this.sportType,
    this.goal,
    this.startDate,
    this.endDate,
    this.suggestion,
  });

  AddChallengeState copyWith({
    ChallengeModel? challenge,
    String? error,
    bool? isLoading,
    bool? isSuccess,
    String? challengeName,
    SportPreferences? sportType,
    String? goal,
    String? startDate,
    String? endDate,
    List<SportPreferences>? suggestion,
  }) {
    return AddChallengeState(
      challenge: challenge ?? this.challenge,
      error: error,
      isSuccess: isSuccess,
      isLoading: isLoading ?? this.isLoading,
      challengeName: challengeName ?? this.challengeName,
      sportType: sportType ?? this.sportType,
      goal: goal ?? this.goal,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      suggestion: suggestion ?? this.suggestion,
    );
  }

  @override
  List<Object?> get props => [
    challenge,
    error,
    isLoading,
    isSuccess,
    challengeName,
    sportType,
    goal,
    startDate,
    endDate,
    suggestion,
  ];
}
