import 'package:flutter/material.dart';

class SavedPostsScreen extends StatelessWidget {
  const SavedPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Сохраненные посты')),
      body: const Center(
        child: Text('Здесь будет экран сохраненных постов'),
      ),
    );
  }
}
