import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Neumorphic(
              style: const NeumorphicStyle(
                boxShape: NeumorphicBoxShape.circle(),
                depth: 5,
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Username',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            NeumorphicButton(
              onPressed: () {
                // Follow or Edit Profile action
              },
              child: const Text('Follow/Edit Profile'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    Text('Posts',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('123'),
                  ],
                ),
                Column(
                  children: const [
                    Text('Followers',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('456'),
                  ],
                ),
                Column(
                  children: const [
                    Text('Following',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('789'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Description'),
                  SizedBox(height: 10),
                  Text(
                    'Website',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Neumorphic(
                  style: NeumorphicStyle(
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(4)),
                    depth: 1,
                  ),
                  child: Image.asset('assets/image.jpg', fit: BoxFit.cover),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
