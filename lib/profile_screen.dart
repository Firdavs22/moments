import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _buildProfileHeader(BuildContext context) {
    return const Text("Profile Header");
  }

  Widget _buildStatsRow(BuildContext context) {
    return const Text("Stats Row");
  }

  Widget _buildUserInfo(BuildContext context) {
    return const Text("User Info");
  }

  Widget _buildPostsGrid(BuildContext context) {
    return const Text("Posts Grid");
  }

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
}
