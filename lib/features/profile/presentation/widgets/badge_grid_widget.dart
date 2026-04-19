import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../profile/domain/entities/badge_entity.dart';

class BadgeGridWidget extends StatelessWidget {
  const BadgeGridWidget({super.key, required this.badges});

  final List<BadgeEntity> badges;

  @override
  Widget build(BuildContext context) {
    if (badges.isEmpty) {
      return const Center(child: Text('아직 획득한 뱃지가 없어요', style: AppTextStyles.body2));
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 12, crossAxisSpacing: 12),
      itemCount: badges.length,
      itemBuilder: (_, index) => _BadgeItem(badge: badges[index]),
    );
  }
}

class _BadgeItem extends StatelessWidget {
  const _BadgeItem({required this.badge});
  final BadgeEntity badge;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(badge.emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 4),
          Text(badge.label, style: AppTextStyles.caption, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
