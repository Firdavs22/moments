import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Post> posts = [
    Post(
        type: PostType.singleImage,
        title: 'Пост 1',
        imageUrl: 'assets/image1.jpg'),
    Post(
        type: PostType.carousel,
        title: 'Пост 2',
        imagesUrl: ['assets/image2.jpg', 'assets/image3.jpg']),
    // Добавьте другие посты здесь
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Лента'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return GestureDetector(
            onTap: () {
              // Открыть экран с подробностями поста
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostDetailsScreen(post: post)),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.title,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      if (post.type == PostType.singleImage)
                        Image.asset(post.imageUrl!)
                      else if (post.type == PostType.carousel)
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: post.imagesUrl!
                                .map((imageUrl) => Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Image.asset(imageUrl),
                                    ))
                                .toList(),
                          ),
                        ),
                      // Здесь вы можете добавить другие виджеты для отображения информации о посте
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

enum PostType { singleImage, carousel }

class Post {
  final PostType type;
  final String title;
  final String? imageUrl;
  final List<String>? imagesUrl;

  Post(
      {required this.type, required this.title, this.imageUrl, this.imagesUrl});
}

class PostDetailsScreen extends StatelessWidget {
  final Post post;

  PostDetailsScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Подробности поста'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              if (post.type == PostType.singleImage)
                Image.asset(post.imageUrl!)
              else if (post.type == PostType.carousel)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: post.imagesUrl!
                        .map((imageUrl) => Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Image.asset(imageUrl),
                            ))
                        .toList(),
                  ),
                ),
              SizedBox(height: 16),
              // Здесь вы можете добавить виджеты, которые отображают контент статьи, если это необходимо
              // Например, вы можете использовать виджет Text с длинным текстом статьи
              Text(
                'Текст статьи здесь. Текст статьи здесь. Текст статьи здесь. Текст статьи здесь. Текст статьи здесь.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
