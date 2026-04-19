import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('회원가입')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const AppTextField(hint: '닉네임'),
            const SizedBox(height: 12),
            const AppTextField(hint: '이메일', keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 12),
            const AppTextField(hint: '비밀번호', obscureText: true),
            const SizedBox(height: 24),
            AppButton(label: '가입하기', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
