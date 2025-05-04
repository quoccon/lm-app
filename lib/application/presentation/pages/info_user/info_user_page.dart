import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/constants/app_colors.dart';
import 'package:lifemap/constants/app_routes.dart';
import 'package:lifemap/constants/app_spaces.dart';

import '../../../cubit/cubit.dart';
import '../../widgets/widget.dart';

class InfoUserPage extends StatelessWidget {
  const InfoUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold<InfoUserCubit>(
      body: InfoUserBody(),
      title: const Text("Thông tin người dùng"),
    );
  }
}

class InfoUserBody extends StatefulWidget {
  const InfoUserBody({super.key});

  @override
  State<InfoUserBody> createState() => _InfoUserBodyState();
}

class _InfoUserBodyState extends State<InfoUserBody> {
  @override
  Widget build(BuildContext context) {
    final authCubit = GetIt.I.get<AuthCubit>();
    final user = authCubit.state.user;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FieldHeader("Email"),
          AppSpaces.space12.vertical,
          AppTextField(
            initText: user?.email,
            readOnly: true,
            enabled: false,
            onChanged: (p0) {},
          ),

          FieldHeader("Tên người dùng"),
          AppSpaces.space12.vertical,
          AppTextField(
            initText: user?.username,
            hintText: "Nhập tên người dùng",
            onChanged: (p0) {},
          ),
          FieldHeader("Giới tính"),
          AppSpaces.space12.vertical,
          AppTextField(
            readOnly: true,
            enabled: false,
            initText: user?.gender,
            onChanged: (p0) {},
          ),

          FieldHeader("Sở thích bộ môn"),
          AppSpaces.space12.vertical,
          Row(
            children: [
              ...?user?.sportPreferences?.map(
                (e) => AppBgContainer(
                  bgColor: BackgroundColor.secondary,
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                  border: Border.all(width: 1, color: TextColor.gray),
                  radius: BorderRadius.all(Radius.circular(20)),
                  child: Text(e.suggestName ?? '', textAlign: TextAlign.center),
                ),
              ),
              AppSpaces.space8.horizontal,
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.listSuggest);
                },
                child: AppBgContainer(
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                  border: Border.all(width: 1, color: TextColor.gray),
                  radius: BorderRadius.all(Radius.circular(20)),
                  child: Text("Chỉnh sửa", textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
