import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  Widget _buildTopBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              // Добавьте логику для возврата на предыдущий экран
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          const Text(
            '1 / 99',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassCounterButton(IconData icon, int count, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              '$count',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
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
              itemCount: 99,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: _buildTopBar(context),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildGlassCounterButton(Icons.favorite, 10, () {
                      // Добавьте логику для лайка
                    }),
                    _buildGlassCounterButton(Icons.comment, 5, () {
                      // Добавьте логику для комментариев
                    }),
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