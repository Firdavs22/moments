import 'package:flutter/material.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Создать пост')),
      body: const Center(
        child: Text('Здесь будет экран создания поста'),
      ),
    );
  }
}
