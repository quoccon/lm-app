import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/application/datasource/remote/auth_remote.dart';

import '../../../constants/constants.dart';

part 'register_state.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit(this._authRemote) : super(RegisterState());

  final AuthRemote _authRemote;

  void changeUsername(String? username) {
    emit(state.copyWith(username: username));
  }

  void changeEmail(String? email) {
    emit(state.copyWith(email: email));
  }

  void changeGender(GenderEnum? gender) {
    emit(state.copyWith(gender: gender));
  }

  void changePassword(String? password) {
    emit(state.copyWith(password: password));
  }

  Future register() async {
    emit(state.copyWith(isLoading: true));

    final username = state.username;
    final email = state.email;
    final gender = state.gender;
    final password = state.password;
    final result = await _authRemote.register(
      username: username ?? '',
      email: email ?? '',
      gender: gender?.genderString ?? '',
      password: password ?? '',
    );

    result.fold(
      (error) {
        emit(state.copyWith(isLoading: false, error: error.message));
      },
      (success) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      },
    );
  }

  Future verifyOtp() async {

  }
}
