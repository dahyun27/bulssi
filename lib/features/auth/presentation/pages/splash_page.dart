import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('🔥', style: TextStyle(fontSize: 64)),
            SizedBox(height: 16),
            Text('불씨', style: AppTextStyles.heading1),
            SizedBox(height: 8),
            Text('나만 안 하고 있었어. 혼자라서 그래.', style: AppTextStyles.body2),
          ],
        ),
      ),
    );
  }
}
