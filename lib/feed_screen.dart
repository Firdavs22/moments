import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Лента')),
      body: Center(
        child: Text('Здесь будет главная лента'),
      ),
    );
  }
}
