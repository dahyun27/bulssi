import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';

class RoomCodeInputWidget extends StatelessWidget {
  const RoomCodeInputWidget({super.key, required this.onSubmit});

  final ValueChanged<String> onSubmit;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Column(
      children: [
        AppTextField(hint: '초대 코드 6자리 입력', controller: controller),
        const SizedBox(height: 16),
        AppButton(label: '참여하기', onPressed: () => onSubmit(controller.text)),
      ],
    );
  }
}
