part of 'login_cubit.dart';

class LoginState extends BaseState {
  final String? email;
  final String? password;
  final bool isRemember;

  const LoginState({
    this.email,
    this.password,
    this.isRemember = false,
    super.error,
    super.isLoading,
    super.isSuccess,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isRemember,
    String? error,
    bool? isLoading,
    bool? isSuccess,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isRemember: isRemember ?? this.isRemember,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess,
      error: error,
    );
  }

  bool get inValid {
    return email.isNotEmptyOrNull && password.isNotEmptyOrNull;
  }

  @override
  List<Object?> get props => [
    email,
    password,
    isRemember,
    isLoading,
    isSuccess,
    error,
  ];
}
