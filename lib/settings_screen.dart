import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Поиск')),
      body: const Center(
        child: Text('Здесь будет экран поиска'),
      ),
    );
  }
}
