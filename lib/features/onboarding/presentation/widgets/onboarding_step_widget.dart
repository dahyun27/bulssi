import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class OnboardingStepWidget extends StatelessWidget {
  const OnboardingStepWidget({
    super.key,
    required this.step,
    required this.title,
    required this.description,
  });

  final int step;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: AppTextStyles.heading1, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Text(description, style: AppTextStyles.body1, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
