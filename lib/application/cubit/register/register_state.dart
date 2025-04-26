part of 'register_cubit.dart';

class RegisterState extends BaseState {
  final String? username;
  final String? email;
  final GenderEnum? gender;
  final String? password;

  const RegisterState({
    this.username,
    this.email,
    this.gender,
    this.password,
    super.error,
    super.isLoading,
    super.isSuccess,
  });

  RegisterState copyWith({
    String? username,
    String? email,
    GenderEnum? gender,
    String? password,
    String? error,
    bool? isLoading,
    bool? isSuccess,
  }) {
    return RegisterState(
      username: username ?? this.username,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      password: password ?? this.password,
      error: error,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess,
    );
  }

  @override
  List<Object?> get props => [
    username,
    email,
    gender,
    password,
    error,
    isLoading,
    isSuccess,
  ];
}
