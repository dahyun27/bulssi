import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';

class MissionVerifyPage extends StatelessWidget {
  const MissionVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('오늘의 인증')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            AppButton(label: '사진으로 인증', onPressed: () {}),
            const SizedBox(height: 12),
            AppButton(label: '텍스트로 인증', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
