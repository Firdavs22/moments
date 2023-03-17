import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text('Лента'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    child: PageView.builder(
                      itemBuilder: (context, index) {
                        return Image.network(
                          'https://source.unsplash.com/random?sig=$index',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: NeumorphicButton(
                      onPressed: () {
                        // TODO: Реализовать функционал для просмотра полной статьи
                      },
                      child: Text('Открыть статью'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NeumorphicButton(
                    onPressed: () {
                      // TODO: Реализовать функционал лайков
                    },
                    child: Icon(Icons.favorite_border),
                  ),
                  Text(
                      '10'), // Замените число на переменную с количеством лайков
                  NeumorphicButton(
                    onPressed: () {
                      // TODO: Реализовать функционал "поделиться"
                    },
                    child: Icon(Icons.share),
                  ),
                  Text(
                      '5'), // Замените число на переменную с количеством поделившихся
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12),
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Добавить комментарий',
                          prefixIcon: Icon(Icons.comment),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                      '3'), // Замените число на переменную с количеством комментариев
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
