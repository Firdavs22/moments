import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moments')),
      body: ListView.builder(
        itemCount: 10, // количество постов в ленте
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 16),
            child: _buildPost(context),
          );
        },
      ),
    );
  }

  Widget _buildPost(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final postWidth = screenWidth * 0.8;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Neumorphic(
                    style: const NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.circle(),
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.jpg'),
                      radius: 20,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Username',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Location'),
                    ],
                  ),
                ],
              ),
              const Text('Date'),
            ],
          ),
          const SizedBox(height: 8),
          Neumorphic(
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(12),
              ),
            ),
            child: Image.asset(
              'assets/images/post.jpg',
              width: postWidth,
              height: postWidth,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                  const Text('1000'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.comment),
                  ),
                  const Text('25'),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Username',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            'Caption text with #hashtags and @mentions',
            style: TextStyle(height: 1.2),
          ),
          const SizedBox(height: 4),
          const Text(
            'View all 25 comments',
            style: TextStyle(color: Colors.grey),
          ),
          Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Add a comment...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
