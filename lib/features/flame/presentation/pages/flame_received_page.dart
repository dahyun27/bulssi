import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/flame_animation_widget.dart';

class FlameReceivedPage extends StatelessWidget {
  const FlameReceivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlameAnimationWidget(),
            SizedBox(height: 24),
            Text('불꽃을 받았어요!', style: AppTextStyles.heading1),
          ],
        ),
      ),
    );
  }
}
