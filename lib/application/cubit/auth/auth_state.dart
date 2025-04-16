part of 'auth_cubit.dart';

class AuthState extends BaseState {
  final String? token;
  final UserModel? user;

  const AuthState({this.token, this.user});

  AuthState copyWith({String? token, UserModel? user, bool isLogout = false}) {
    return AuthState(
      token: isLogout ? null : token ?? this.token,
      user: isLogout ? null : user ?? this.user,
    );
  }

  bool get isLogined => (token ?? '').isNotEmpty;

  @override
  List<Object?> get props => [token, user];
}
