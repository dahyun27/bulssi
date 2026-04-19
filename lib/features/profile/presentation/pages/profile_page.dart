import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../widgets/badge_grid_widget.dart';
import '../widgets/stats_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('프로필')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40))),
            SizedBox(height: 16),
            Center(child: Text('닉네임', style: AppTextStyles.heading2)),
            SizedBox(height: 32),
            StatsWidget(totalVerifications: 0, maxStreak: 0, currentStreak: 0),
            SizedBox(height: 32),
            Text('획득한 뱃지', style: AppTextStyles.heading2),
            SizedBox(height: 16),
            BadgeGridWidget(badges: []),
          ],
        ),
      ),
    );
  }
}
