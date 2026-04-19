import 'package:flutter/material.dart';

class RoomDetailPage extends StatelessWidget {
  const RoomDetailPage({super.key, required this.roomId});

  final String roomId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('방')),
      body: const Center(child: Text('인증 피드')),
    );
  }
}
