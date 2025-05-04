import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/application/cubit/auth/auth_cubit.dart';
import 'package:lifemap/application/datasource/remote/auth_remote.dart';

part 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(this._authRemote, this._authCubit) : super(LoginState());

  final AuthRemote _authRemote;
  final AuthCubit _authCubit;

  void changeEmail(String? email) {
    emit(state.copyWith(email: email));
  }

  void changePassword(String? password) {
    emit(state.copyWith(password: password));
  }

  void changeRemember(bool isRemember) {
    emit(state.copyWith(isRemember: isRemember));
  }

  Future loginWithEmailAndPass() async {
    final email = state.email;
    final password = state.password;
    final isRemember = state.isRemember;

    emit(state.copyWith(isLoading: true));

    final result = await _authRemote.loginWithEmailAndPass(
      email: email ?? '',
      password: password ?? '',
      isRemember: isRemember ?? false,
    );

    result.fold(
      (error) {
        emit(state.copyWith(error: error.message, isLoading: false));
      },
      (success) {
        _authCubit.setUserInfo(
          token: success?.token,
          user: success?.user,
          isSaveUserToken: state.isRemember ?? false,
        );
        emit(state.copyWith(isLoading: false, isSuccess: true));
      },
    );
  }
}
