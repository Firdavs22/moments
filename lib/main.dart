import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'search_screen.dart';
import 'feed_screen.dart';
import 'create_post_screen.dart';

void main() {
  runApp(const MomentsApp());
}

class MomentsApp extends StatelessWidget {
  const MomentsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      theme: NeumorphicThemeData(
        baseColor: Color.fromARGB(255, 238, 238, 238),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;

  final List<Widget> _screens = [
    const SearchScreen(),
    const FeedScreen(),
    const CreatePostScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Neumorphic(
              style: const NeumorphicStyle(
                boxShape: NeumorphicBoxShape.circle(),
                depth: 8,
                intensity: 0.6,
              ),
              child: const CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Username',
              style: TextStyle(fontSize: 17),
            ),
            const Spacer(),
            Image.asset(
              'assets/logo.png',
              height: 24,
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NeumorphicBackground(
        child: Container(
          padding: const EdgeInsets.only(bottom: 1),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NeumorphicButton(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(15),
                  ),
                ),
                child: Image.asset('assets/global-search.png',
                    width: 37, height: 37),
                onPressed: () => _onItemTapped(0),
              ),
              NeumorphicButton(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(15),
                  ),
                ),
                child: Image.asset('assets/play-cricle.png',
                    width: 37, height: 37),
                onPressed: () => _onItemTapped(1),
              ),
              NeumorphicButton(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(15),
                  ),
                ),
                child: Image.asset('assets/video-vertical.png',
                    width: 37, height: 37),
                onPressed: () => _onItemTapped(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
