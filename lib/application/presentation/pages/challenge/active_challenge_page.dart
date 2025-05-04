import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/application/cubit/challenge/challenge_cubit.dart';
import 'package:lifemap/application/presentation/widgets/app_empty.dart';
import 'package:lifemap/application/presentation/widgets/challenge_item.dart';
import 'package:lifemap/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ActiveChallengePage extends StatelessWidget {
  final int status;

  const ActiveChallengePage({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return AppScaffold<ChallengeCubit>(
      onReceiveArguments: (params, cubit) {
        cubit?.saveArg(status);
      },
      onInit: (cubit) {
        cubit?.getChallengeByMe();
      },
      body: ActiveChallengeBody(),
      padding: EdgeInsets.all(0),
    );
  }
}

class ActiveChallengeBody extends StatefulWidget {
  const ActiveChallengeBody({super.key});

  @override
  State<ActiveChallengeBody> createState() => _ActiveChallengeBodyState();
}

class _ActiveChallengeBodyState extends State<ActiveChallengeBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChallengeCubit, ChallengeState>(
      builder: (context, state) {
        if (state.loading == true) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Tổng thử thách: ${state.totalChallenge ?? "__"}",
                      style: AppTextStyle.eSmall.copyWith(
                        color: TextColor.secondary,
                      ),
                    ),
                    AppSpaces.space20.vertical,

                    Expanded(
                      child:
                          state.data == null || state.data!.isEmpty
                              ? AppEmpty(content: _buildEmpty())
                              : ListView.builder(
                                itemCount: state.data?.length,
                                itemBuilder: (context, index) {
                                  final challenge = state.data?[index];
                                  return Column(
                                    children: [
                                      ChallengeItem(item: challenge),
                                      AppSpaces.space12.vertical,
                                    ],
                                  );
                                },
                              ),
                    ),
                  ],
                ),
              ),
            ),
            Lottie.asset('assets/lottie/fire.json'),
          ],
        );
      },
    );
  }

  Widget _buildEmpty() {
    return Column(
      children: [
        Text(
          "Bạn chưa có thử thách nào cho bản thân",
          style: AppTextStyle.eSmall.copyWith(color: TextColor.secondary),
        ),
        RichText(
          text: TextSpan(
            text: 'Hãy ',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'Thêm mới ',
                style: AppTextStyle.regular.semibold.copyWith(
                  color: TextColor.colorText,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, AppRoute.addChallenge);
                  },
              ),
              TextSpan(text: 'hoặc '),
              TextSpan(
                text: 'Tham gia thử thách',
                style: AppTextStyle.regular.semibold.copyWith(
                  color: TextColor.colorText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
