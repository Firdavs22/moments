import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'search_screen.dart';
import 'feed_screen.dart';
import 'reels_screen.dart';
import 'main_screen.dart';
import 'hexagon_clipper.dart';
import 'feed_screen.dart';

void main() {
  runApp(MomentsApp());
}

class MomentsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
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
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    SearchScreen(),
    FeedScreen(),
    ReelsScreen(),
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
              // добавьте Flexible здесь
              child: Row(
                children: [
                  ClipPath(
                    clipper: HexagonClipper(),
                    child: Container(
                      color: Color.fromARGB(255, 255, 0, 0),
                      height: 33,
                      width: 33,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
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
          padding: EdgeInsets.only(bottom: 1),
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
              NeumorphicButton(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(15),
                  ),
                ),
                child: Image.asset('assets/video-vertical.png',
                    width: 40, height: 50),
                onPressed: () => _onItemTapped(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CreatePostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ReelsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SavedPostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
