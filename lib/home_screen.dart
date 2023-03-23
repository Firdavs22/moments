import 'package:flutter/material.dart';
import 'top_bar.dart';
import 'post_widget.dart';
import 'navigation_bar.dart' as custom_nav;

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Map<String, dynamic> post = {
    'date': DateTime.now(),
    'likes': 0,
    'shares': 0,
    'description': 'Example description',
    'comments': [
      {'user': 'User 1', 'text': 'Example comment'}
    ],
  };

  final Map<String, dynamic> user = {
    'name': 'User Name',
    'avatar':
        'https://i.pinimg.com/originals/0d/0c/da/0d0cda50d82a825d602ad45547112b0d.jpg',
    'location': 'Example Location',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        userName: user['name'],
        avatarUrl: user['avatar'],
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: PostWidget(
              userName: user['name'],
              avatarUrl: user['avatar'],
              postDate: post['date'].toString(),
              location: user['location'],
              mediaContent: [
                AspectRatio(
                  aspectRatio: 1 / 1, // пропорции изображения
                  child: Image.network(
                    'https://s1.1zoom.ru/b4348/416/Jiuzhaigou_park_China_511221_600x800.jpg',
                    fit: BoxFit.cover,
                  ),
                )
              ],
              likeCount: post['likes'],
              shareCount: post['shares'],
              description: post['description'],
              comments: post['comments']
                  .map<String>(
                      (comment) => '${comment['user']}: ${comment['text']}')
                  .toList(),
            ),
          );
        },
      ),
      bottomNavigationBar: const custom_nav.NavigationBar(),
    );
  }
}
