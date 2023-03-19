// ignore_for_file: prefer_const_constructors

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'search_screen.dart';
import 'feed_screen.dart';
import 'reels_screen.dart';
import 'hexagon_clipper.dart';

void main() {
  runApp(const MomentsApp());
}

class MomentsApp extends StatelessWidget {
  const MomentsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      theme: const NeumorphicThemeData(
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
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const SearchScreen(),
    FeedScreen(), // Убедитесь, что используете правильный FeedScreen здесь
    const ReelsScreen(),
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
            Flexible(
              child: Row(
                children: [
                  ClipPath(
                    clipper: HexagonClipper(),
                    child: Container(
                      color: const Color.fromARGB(255, 255, 0, 0),
                      height: 33,
                      width: 33,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Username',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/logo.png',
              height: 15,
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NeumorphicBackground(
        child: Container(
          padding: const EdgeInsets.only(bottom: 1),
          height: 110,
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
                    width: 40, height: 50),
                onPressed: () => _onItemTapped(0),
              ),
              NeumorphicButton(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(15),
                  ),
                ),
                child: Image.asset('assets/play-cricle.png',
                    width: 40, height: 50),
                onPressed: () => _onItemTapped(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
