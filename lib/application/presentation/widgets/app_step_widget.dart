import 'package:flutter/material.dart';
import 'package:flutter_cors/flutter_core.dart';

import '../../../../constants/constants.dart';

class AppStepWidget extends StatefulWidget {
  const AppStepWidget(
      {super.key,
      required this.totalSteps,
      required this.currentStep,
      this.stepDescription});

  final int totalSteps;
  final int currentStep;
  final String? stepDescription;

  @override
  State<AppStepWidget> createState() => _AppStepWidgetState();
}

class _AppStepWidgetState extends State<AppStepWidget> {
  List<int> indexs = [];
  @override
  void initState() {
    super.initState();
    indexs = List.generate(widget.totalSteps, (index) => index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: indexs.map((e) {
            return Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: AppRadius.radius12,
                  color: e + 1 <= widget.currentStep
                      ? BackgroundColor.brandPrimary
                      : IconColor.teritary,
                ),
                height: 6,
              ),
            );
          }).toList(),
        ),
        if (widget.stepDescription.isNotEmptyOrNull) ...[
          AppSpaces.space8.vertical,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
                'Bước ${widget.currentStep}/${widget.totalSteps}: ${widget.stepDescription}'),
          )
        ],
      ],
    );
  }
}
