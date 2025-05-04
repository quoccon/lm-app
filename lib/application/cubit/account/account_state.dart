part of 'account_cubit.dart';

class AccountState extends BaseState {
  final bool isPopUpNoti;

  const AccountState({
    this.isPopUpNoti = false,
    super.error,
    super.isLoading,
    super.isSuccess,
  });

  AccountState copyWith({
    bool? isPopUpNoti,
    String? error,
    bool? isLoading,
    bool? isSuccess,
  }) {
    return AccountState(
      isPopUpNoti: isPopUpNoti ?? this.isPopUpNoti,
      error: error,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess,
    );
  }

  @override
  List<Object?> get props => [isPopUpNoti, error, isLoading, isSuccess];
}
