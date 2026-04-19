import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class RoomCardWidget extends StatelessWidget {
  const RoomCardWidget({
    super.key,
    required this.title,
    required this.category,
    required this.memberCount,
  });

  final String title;
  final String category;
  final int memberCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.body1),
                Text(category, style: AppTextStyles.caption),
              ],
            ),
          ),
          Text('$memberCount명', style: AppTextStyles.body2),
        ],
      ),
    );
  }
}
