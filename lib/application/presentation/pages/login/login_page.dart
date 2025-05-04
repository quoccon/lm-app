import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/utils/image_utils.dart';

import '../../../../constants/constants.dart';
import '../../../cubit/cubit.dart';
import '../../widgets/widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold<LoginCubit>(
      onSubmitSuccess: (cubit, state) {
        Navigator.of(context).pushReplacementNamed(AppRoute.mainTab);
      },
      isShowHeaderLine: false,
      title: const Text(""),
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("hey there", style: AppTextStyle.regular),
        AppSpaces.space6.vertical,
        Text("Chào mừng trở lại", style: AppTextStyle.heading.semibold),
        AppSpaces.space32.vertical,
        Expanded(child: _buildInput(cubit: cubit)),
        _buildButtonLogin(cubit),
        AppSpaces.space8.vertical,
        _buildActionButton(context),
      ],
    );
  }

  Widget _buildInput({required LoginCubit cubit}) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              hintText: 'Nhập email của bạn',
              keyboardType: TextInputType.emailAddress,
              onChanged: (p0) {
                cubit.changeEmail(p0);
              },
            ),
            AppSpaces.space12.vertical,
            AppTextField(
              hintText: 'Nhập password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onChanged: (p0) {
                cubit.changePassword(p0);
              },
            ),
            AppSpaces.space12.vertical,
            Row(
              children: [
                Checkbox(
                  value: state.isRemember,
                  onChanged: (value) {
                    cubit.changeRemember(value ?? false);
                  },
                ),
                AppSpaces.space4.horizontal,
                Text("Ghi nhớ đăng nhập",style: AppTextStyle.eSmall,)
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildButtonLogin(LoginCubit cubit) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: BackgroundColor.colorButton,
              foregroundColor: BackgroundColor.inverse,
            ),
            onPressed:
                (!state.inValid)
                    ? null
                    : () {
                      cubit.loginWithEmailAndPass();
                    },
            child: Text(
              "Đăng nhập",
              style: AppTextStyle.heading.bold.copyWith(
                color: TextColor.inverse,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLine(height: 1, color: BackgroundColor.secondary),
            AppSpaces.space4.horizontal,
            Text("Or", style: AppTextStyle.eSmall),
            AppSpaces.space4.horizontal,
            AppLine(height: 1, color: BackgroundColor.secondary),
          ],
        ),
        AppSpaces.space20.vertical,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBgContainer(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              border: Border.all(width: 1, color: BackgroundColor.secondary),
              child: Image.asset(AssetsUrl.image('ic_google.png')),
            ),
            AppSpaces.space32.horizontal,
            AppBgContainer(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              border: Border.all(width: 1, color: BackgroundColor.secondary),
              child: Image.asset(AssetsUrl.image('ic_facbook.png')),
            ),
          ],
        ),
        AppSpaces.space8.vertical,
        _registerNow(context),
      ],
    );
  }

  Widget _registerNow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bạn chưa có tài khoản?',
            style: AppTextStyle.regular,
            textAlign: TextAlign.center,
          ),
          AppSpaces.space4.horizontal,
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoute.register);
            },
            child: Text(
              "Đăng ký",
              style: AppTextStyle.regular.semibold.copyWith(
                color: TextColor.colorText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
