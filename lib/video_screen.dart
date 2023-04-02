import 'dart:ui';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<String> videoUrls = [
    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4',
    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_3mb.mp4',
  ];

  List<VideoPlayerController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (String url in videoUrls) {
      _controllers.add(VideoPlayerController.network(url)..initialize());
    }
  }

  @override
  void dispose() {
    for (VideoPlayerController controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
=======
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:glassmorphism/glassmorphism.dart';
>>>>>>> 5b5ed3d (Initial commit)

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
  Widget _buildGlassButton(IconData icon, VoidCallback onPressed) {
    return GlassContainer(
      child: IconButton(
        icon: Icon(icon),
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}

class GlassContainer extends StatelessWidget {
  final Widget child;

  GlassContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(2, 2),
              ),
            ],
            color: Colors.white.withOpacity(0.2),
          ),
          child: child,
        ),
      ),
    );
  }
}

// Функция для создания кнопок с эффектом гласморфизма
Widget _buildGlassButton(IconData icon, VoidCallback onPressed) {
  return GlassContainer(
    child: IconButton(
      icon: Icon(icon),
      color: Colors.white,
      onPressed: onPressed,
    ),
  );
}

// Функция для создания верхней панели
Widget _buildTopBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Кнопка назад
        _buildGlassButton(Icons.arrow_back, () {
          // Вернуться на предыдущий экран
          Navigator.pop(context);
        }),
        // Аватарка и имя пользователя
        GlassContainer(
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://userpic.fishki.net/2019/04/19/346029/5b23aced74af53bc379480749dd39766.jpg'), // Ссылка на изображение аватара пользователя
              ),
              const SizedBox(width: 5),
              const Text(
                'Username', // Имя пользователя
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        // Логотип
        GlassContainer(
          child: Image.asset(
            'assets/logo.png', // Ссылка на изображение логотипа
            height: 30,
            width: 77,
          ),
        ),
      ],
    ),
  );
}

Widget _buildGlassCounterButton(
    IconData icon, int count, VoidCallback onPressed) {
  return GlassContainer(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon),
          color: Colors.white,
          onPressed: onPressed,
        ),
        Text(
          '$count',
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

// ...
class _VideoScreenState extends State<VideoScreen> {
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Виджет PageView для вертикальной прокрутки видео
            PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                // Здесь должна быть логика отображения видео
// Вместо этого мы используем контейнеры для демонстрации
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Center(
                    child: Text(
                      'Video ${index + 1}',
                      style: const TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ),
                );
              },
              itemCount: 99, // Количество видео в ленте
              onPageChanged: (index) {
                _currentPageNotifier.value = index;
              },
            ),
            // Верхняя панель
            Align(
              alignment: Alignment.topCenter,
              child: _buildTopBar(context),
            ),

            // Интерактивные элементы: лайк, комментарии, поделиться
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Лайк с счетчиком
                    _buildGlassCounterButton(Icons.favorite, 10, () {
                      // Добавьте логику для лайка
                    }),
                    // Комментарии с счетчиком
                    _buildGlassCounterButton(Icons.comment, 5, () {
                      // Добавьте логику для комментариев
                    }),
                    // Поделиться с счетчиком
                    _buildGlassCounterButton(Icons.share, 3, () {
                      // Добавьте логику для отправки видео другим пользователям
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
