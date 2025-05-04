part of 'suggestion_cubit.dart';

class SuggestionState extends BaseState {
  final List<SportPreferences>? suggestion;
  final bool? loading;

  const SuggestionState({
    this.suggestion,
    super.error,
    super.isLoading,
    super.isSuccess,
    this.loading,
  });

  SuggestionState copyWith({
    List<SportPreferences>? suggestion,
    String? error,
    bool? isLoading,
    bool? isSuccess,
    bool? loading,
  }) {
    return SuggestionState(
      suggestion: suggestion ?? this.suggestion,
      error: error,
      isSuccess: isSuccess,
      isLoading: isLoading ?? this.isLoading,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [suggestion, error, isLoading, isSuccess, loading];
}
