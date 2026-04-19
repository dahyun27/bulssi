import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class VerificationCardWidget extends StatelessWidget {
  const VerificationCardWidget({
    super.key,
    required this.nickname,
    required this.content,
    this.imageUrl,
  });

  final String nickname;
  final String content;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nickname, style: AppTextStyles.body1),
          const SizedBox(height: 8),
          if (imageUrl != null) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(imageUrl!, height: 200, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
          ],
          Text(content, style: AppTextStyles.body2),
        ],
      ),
    );
  }
}
