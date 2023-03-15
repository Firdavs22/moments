import 'package:flutter/material.dart';
import 'auth_screen.dart';
import 'feed_screen.dart';
import 'search_screen.dart';
import 'profile_screen.dart';
import 'create_post_screen.dart';
import 'discover_screen.dart';
import 'notifications_screen.dart';
import 'reels_screen.dart';
import 'saved_posts_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          FeedScreen(),
          SearchScreen(),
          CreatePostScreen(),
          DiscoverScreen(),
          NotificationsScreen(),
          ProfileScreen(),
          ReelsScreen(),
          SavedPostsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Лента',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Поиск',
          ),
          // Добавьте остальные элементы для каждого экрана
        ],
      ),
    );
  }
}
