import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/helpers/helpers.dart';

import '../../../../constants/constants.dart';
import '../../../cubit/cubit.dart';
import '../../../datasource/model/user_model.dart';
import '../../widgets/widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold<AccountCubit>(
      body: AccountBody(),
      title: const Text("Tài khoản"),
      isShowHeaderLine: false,
    );
  }
}

class AccountBody extends StatefulWidget {
  const AccountBody({super.key});

  @override
  State<AccountBody> createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  @override
  Widget build(BuildContext context) {
    final authCubit = GetIt.I.get<AuthCubit>().state;
    final user = authCubit.user;
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppSpaces.space12.vertical,
              _buildHeader(user),
              AppSpaces.space48.vertical,
              _buildAccount(),
              AppSpaces.space20.vertical,
              _buildPopUpNotification(state),
              AppSpaces.space20.vertical,
              _buildOtherAction(),
              AppSpaces.space20.vertical,
              _actionLogout(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(UserModel? user) {
    return Row(
      children: [
        ClipOval(child: AppImage(url: user?.avatar, width: 55, height: 55)),
        AppSpaces.space12.horizontal,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user?.username ?? '', style: AppTextStyle.regular.semibold),
            AppSpaces.space8.vertical,
            Text(
              "Châm ngôn cuộc sống..",
              style: AppTextStyle.eSmall.copyWith(color: IconColor.secondary),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAccount() {
    return AppBgContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1), // Subtle shadow color
          blurRadius: 5,
          spreadRadius: 0.5,
          offset: const Offset(0, 1),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tài khoản", style: AppTextStyle.large.semibold),

          ...ActionAccountEnum.values.map(
            (e) => ActionItem(icon: e.icon, title: e.text, router: e.router),
          ),
        ],
      ),
    );
  }

  Widget _buildPopUpNotification(AccountState state) {
    return AppBgContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1), // Subtle shadow color
          blurRadius: 5,
          spreadRadius: 0.5,
          offset: const Offset(0, 1),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Thông báo", style: AppTextStyle.large.semibold),
          AppSpaces.space8.vertical,
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    AppIcon.size20(
                      'ic_notification.svg',
                      color: IconColor.iconColor,
                    ),
                    AppSpaces.space12.horizontal,
                    Text(
                      "Bật thông báo",
                      style: AppTextStyle.eSmall.copyWith(
                        color: TextColor.gray,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: state.isPopUpNoti,
                onChanged: (value) {
                  final cubit = context.read<AccountCubit>();
                  cubit.toggleNoti(value);
                },
                activeColor: IconColor.brand,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey[300],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOtherAction() {
    return AppBgContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1), // Subtle shadow color
          blurRadius: 5,
          spreadRadius: 0.5,
          offset: const Offset(0, 1),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Khác", style: AppTextStyle.large.semibold),
          AppSpaces.space8.vertical,

          ...OtherActionEnum.values.map(
            (e) => ActionItem(icon: e.icon, title: e.title, router: e.router),
          ),
        ],
      ),
    );
  }

  Widget _actionLogout() {
    final authCubit = GetIt.I.get<AuthCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: () {
         _showBottomLogout();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text("Đăng xuất"),
      ),
    );
  }

  void _showBottomLogout() {
    final authCubit = GetIt.I.get<AuthCubit>();
    UIHelper.showAppDialog(
      context,
      title: "Xác nhận",
      description: "Bạn có chắc chắn muốn đăng xuất không?",
      mainButtonColor: BackgroundColor.negativeInverse,
      barrierDismissible: true,
      onPressMainButton: () {
        authCubit.logout();
        Navigator.pushReplacementNamed(context, AppRoute.login);
      },
    );
  }
}

class ActionItem extends StatelessWidget {
  final String icon;
  final String title;
  final String router;

  const ActionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, router);
        },
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  AppIcon.size20(icon, color: IconColor.iconColor),
                  AppSpaces.space12.horizontal,
                  Text(
                    title,
                    style: AppTextStyle.eSmall.copyWith(color: TextColor.gray),
                  ),
                ],
              ),
            ),

            AppIcon.size20('ic_arrow.svg'),
          ],
        ),
      ),
    );
  }
}
