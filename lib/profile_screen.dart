import 'package:flutter_neumorphic/flutter_neumorphic.dart';

<<<<<<< HEAD
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
=======
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

>>>>>>> f765d63fdc7713ec9f92f70025df8283f4c137d9
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: const Text('Профиль'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 16),
            _buildStatsRow(context),
            const SizedBox(height: 16),
            _buildUserInfo(context),
            const SizedBox(height: 16),
            _buildPostsGrid(context),
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD
=======

  Widget _buildProfileHeader(BuildContext context) {
    return Row(
      children: [
        Neumorphic(
          style: const NeumorphicStyle(
            boxShape: NeumorphicBoxShape.circle(),
            depth: 8,
            intensity: 0.6,
          ),
          child: const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'username',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              NeumorphicButton(
                onPressed: () {},
                style: NeumorphicStyle(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                ),
                child: const Text('Редактировать профиль'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatItem(context, 'Публикации', 150),
        _buildStatItem(context, 'Подписчики', 1200),
      ],
    );
  }

  Widget _buildStatItem(BuildContext context, String label, int count) {
    return Column(
      children: [
        Text(
          '$count',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Имя пользователя',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text('Описание профиля, интересы, информация о компании.'),
        SizedBox(height: 4),
        Text(
          'https://website.com',
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }

  Widget _buildPostsGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return Neumorphic(
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
            depth: 4,
            intensity: 0.5,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage('assets/images/post_$index.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
>>>>>>> f765d63fdc7713ec9f92f70025df8283f4c137d9
}
