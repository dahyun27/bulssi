import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';

class MissionCreatePage extends StatelessWidget {
  const MissionCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('미션 만들기')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const AppTextField(hint: '오늘의 미션을 입력하세요'),
            const SizedBox(height: 24),
            AppButton(label: '시작하기', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
