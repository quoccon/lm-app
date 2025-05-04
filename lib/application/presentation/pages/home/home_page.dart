import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/application/cubit/cubit.dart';
import 'package:lifemap/constants/app_colors.dart';
import 'package:lifemap/constants/app_spaces.dart';
import 'package:lifemap/constants/app_textstyles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = GetIt.I.get<AuthCubit>();
    return AppScaffold<HomeCubit>(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Chào mừng trở lại",
            style: AppTextStyle.eSmall.copyWith(color: TextColor.gray),
          ),
          AppSpaces.space4.vertical,
          Text(authCubit.state.user?.username ?? '', style: AppTextStyle.heading.semibold),
        ],
      ),
      isShowHeaderLine: false,
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Text("home hahaa");
  }
}
