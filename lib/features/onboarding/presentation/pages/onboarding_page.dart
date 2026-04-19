import 'package:flutter/material.dart';

import '../widgets/onboarding_step_widget.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          OnboardingStepWidget(step: 1, title: '불씨에 오신 걸 환영해요', description: '혼자라서 안 됐던 거예요.'),
          OnboardingStepWidget(step: 2, title: '미션을 만들어요', description: '오늘 할 일을 설정하고 바로 시작하세요.'),
          OnboardingStepWidget(step: 3, title: '방을 탐색해요', description: '같은 목표를 가진 사람들과 함께하세요.'),
        ],
      ),
    );
  }
}
