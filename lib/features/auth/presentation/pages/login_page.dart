import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../widgets/social_login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const AppTextField(hint: '이메일'),
            const SizedBox(height: 12),
            const AppTextField(hint: '비밀번호', obscureText: true),
            const SizedBox(height: 24),
            AppButton(label: '로그인', onPressed: () {}),
            const SizedBox(height: 16),
            const SocialLoginButton(),
          ],
        ),
      ),
    );
  }
}
