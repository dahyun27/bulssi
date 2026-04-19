import 'package:flutter/material.dart';

import '../widgets/feed_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🔥 불씨')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 0,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, index) => const FeedItemWidget(),
      ),
    );
  }
}
