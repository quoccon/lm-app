part of 'challenge_cubit.dart';

class ChallengeState extends BaseState {
  final List<ChallengeModel>? data;
  final int? status;
  final bool? loading;
  final int? totalChallenge;

  const ChallengeState({
    this.data,
    super.error,
    super.isSuccess,
    this.status,
    this.loading,
    this.totalChallenge,
  });

  ChallengeState copyWith({
    List<ChallengeModel>? data,
    String? error,
    bool? isSuccess,
    int? status,
    bool? loading,
    int? totalChallenge,
  }) {
    return ChallengeState(
      data: data ?? this.data,
      error: error,
      isSuccess: isSuccess,
      status: status ?? this.status,
      loading: loading ?? this.loading,
      totalChallenge: totalChallenge ?? this.totalChallenge,
    );
  }

  @override
  List<Object?> get props => [
    data,
    error,
    loading,
    isSuccess,
    status,
    totalChallenge,
  ];
}
