import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/application/presentation/widgets/app_tabbar.dart';
import 'package:lifemap/constants/enum/challenge_status_enum.dart';

import '../../../cubit/cubit.dart';
import 'active_challenge_page.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold<ChallengeCubit>(
      padding: EdgeInsets.all(0),
      isShowHeaderLine: false,
      body: ChallengeBody(),
      title: const Text("Thử thách bản thân"),
    );
  }
}

class ChallengeBody extends StatefulWidget {
  const ChallengeBody({super.key});

  @override
  State<ChallengeBody> createState() => _ChallengeBodyState();
}

class _ChallengeBodyState extends State<ChallengeBody>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController _tabController;

  @override
  bool get wantKeepAlive => false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      UIUtils.hideKeyboard();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTabbar(
            tabs: const [
              Tab(height: 32, text: "Hoạt động"),
              Tab(height: 32, text: "Hoàn thành"),
              Tab(height: 32, text: "Thất bại"),
            ],
            controller: _tabController,
            // padding: EdgeInsets.symmetric(horizontal: 16),
            isTab: true,
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:  [
                ActiveChallengePage(status: ChallengeStatusEnum.active.value,),
                CompleteChallengePage(),
                FailChallengePage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class CompleteChallengePage extends StatelessWidget {
  const CompleteChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("complete");
  }
}

class FailChallengePage extends StatelessWidget {
  const FailChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("fail");
  }
}
