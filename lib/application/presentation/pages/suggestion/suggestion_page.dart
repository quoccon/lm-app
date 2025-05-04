import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';
import 'package:lifemap/application/cubit/cubit.dart';

import '../../../../constants/constants.dart';
import '../../widgets/widget.dart';

class SuggestionPage extends StatelessWidget {
  const SuggestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold<SuggestionCubit>(
      body: SuggestionBody(),
      title: const Text("Môn thể thao sở trường của bạn"),
      onLoadData: (cubit) {
        cubit?.listSuggestion();
      },
    );
  }
}

class SuggestionBody extends StatelessWidget {
  const SuggestionBody({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = GetIt.I.get<AuthCubit>();
    final user = authCubit.state.user;
    return BlocBuilder<SuggestionCubit, SuggestionState>(
      builder: (context, state) {
        if (state.loading == true) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.suggestion?.length ?? 0,
                itemBuilder: (context, index) {
                  final suggest = state.suggestion?[index];
                  final isSelected =
                      user?.sportPreferences?.any(
                        (pref) => pref.id == suggest?.id,
                      ) ??
                      false;
                  return SuggestionItem(
                    title: suggest?.suggestName ?? '',
                    isSelected: isSelected,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class SuggestionItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const SuggestionItem({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AppBgContainer(
      bgColor: isSelected ? TextColor.gray : BackgroundColor.default1,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      border: Border.all(width: 1, color: TextColor.gray),
      radius: BorderRadius.all(Radius.circular(20)),
      child: Text(title, textAlign: TextAlign.center),
    );
  }
}
