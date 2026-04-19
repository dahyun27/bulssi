import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class StreakCounterWidget extends StatelessWidget {
  const StreakCounterWidget({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🔥', style: TextStyle(fontSize: 20)),
        const SizedBox(width: 4),
        Text('$count일 연속', style: AppTextStyles.body1.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
