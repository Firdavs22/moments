import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Auth Screen'), // Измените заголовок для каждого экрана
      ),
      body: const Center(
        child: Text(
            'This is the Auth Screen'), // Измените текст для каждого экрана
      ),
    );
  }
}
