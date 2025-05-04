import 'dart:convert';

import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/application/datasource/model/user_model.dart';
import 'package:lifemap/helpers/helpers.dart';

import '../../../app.dart';

part 'auth_state.dart';

class AuthCubit extends BaseCubit<AuthState> {
  AuthCubit() : super(AuthState());

  String tokenKey = 'userToken';
  String userInfoKey = 'userInfoKey';

  Future initUserInfo() async {
    final token = await _getTokenFromCached();
    final user = await _getUserInfoFromCached();
    emit(state.copyWith(token: token, user: user));

    final appClient = GetIt.I.get<AppClient>();
    appClient.onExpired.listen((isExpired) {
      final currentContext = globalNavigatorKey.currentContext;
      if (isExpired && currentContext != null && state.isLogined) {
        logout();
        UIUtils.showTopSnackbar(
          currentContext,
          message:
              'Phiên đăng nhập của bạn đã hết hạn, vui lòng đăng nhập lại.',
          type: SnackBarType.warning,
        );
        UIHelper.goLogin(currentContext);
      }
    });
  }

  Future setUserInfo({
    TokenModel? token,
    UserModel? user,
    bool isSaveUserToken = false,
  }) async {
    final tokenStr = "${token?.type} ${token?.token}";
    await _saveTokenToCached(isSaveUserToken ?tokenStr : "");
    print('saveToken: ${state.isLogined}');
    await _saveUserInfoToCached(isSaveUserToken ? user : null);
    emit(state.copyWith(token: tokenStr, user: user));
  }

  Future<UserModel?> _getUserInfoFromCached() async {
    final tempUserInfo =
        await SharePrefHelper().getValue(key: userInfoKey) as String?;
    if ((tempUserInfo ?? '').isNotEmpty) {
      return UserModel.fromJson(json.decode(tempUserInfo!));
    }
    return null;
  }

  Future<String?> _getTokenFromCached() async {
    final tempToken =
        await SharePrefHelper().getValue(key: tokenKey) as String?;
    print('tempToken: $tempToken');
    return tempToken;
  }

  Future _saveTokenToCached(String? nToken) async {
    await SharePrefHelper().setValue(nToken ?? "", key: tokenKey);
  }

  Future _saveUserInfoToCached(UserModel? user) async {
    if (user == null) {
      await SharePrefHelper().setValue("", key: userInfoKey);
      return;
    }
    await SharePrefHelper().setValue(
      json.encode(user.toJson()),
      key: userInfoKey,
    );
  }

  Future logout() async {
    await _saveTokenToCached("");
    await _saveUserInfoToCached(null);
    emit(state.copyWith(isLogout: true));
  }
}
