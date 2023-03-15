import 'package:flutter/material.dart';

class SavedPostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Сохраненные посты')),
      body: Center(
        child: Text('Здесь будет экран сохраненных постов'),
      ),
    );
  }
}
