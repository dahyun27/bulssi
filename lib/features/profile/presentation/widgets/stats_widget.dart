import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({
    super.key,
    required this.totalVerifications,
    required this.maxStreak,
    required this.currentStreak,
  });

  final int totalVerifications;
  final int maxStreak;
  final int currentStreak;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _StatItem(label: '총 인증', value: '$totalVerifications'),
        _StatItem(label: '최고 스트릭', value: '$maxStreak일'),
        _StatItem(label: '현재 스트릭', value: '$currentStreak일'),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: AppTextStyles.heading2.copyWith(color: AppColors.primary)),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }
}
