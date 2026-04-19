import 'package:flutter/material.dart';

import '../widgets/room_card_widget.dart';

class RoomListPage extends StatelessWidget {
  const RoomListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('방 탐색')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 0,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, index) => const RoomCardWidget(title: '', category: '', memberCount: 0),
      ),
    );
  }
}
