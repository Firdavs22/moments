import 'home_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'auth_screen.dart';
import 'video_screen.dart';
import 'discover_screen.dart'; // Импортируйте ваши экраны здесь

void main() {
  runApp(const MomentsApp());
}

class MomentsApp extends StatelessWidget {
  const MomentsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      title: 'Neumorphic App',
      themeMode: ThemeMode.light, // Выберите светлую или темную тему
      theme: const NeumorphicThemeData(
        baseColor: Color(0xFFE0E5EC), // Основной цвет фона
        lightSource:
            LightSource.topLeft, // Источник света (например, сверху слева)
        depth: 10, // Глубина тени по умолчанию
      ),
      home: DiscoverScreen(), // Замените HomeScreen на ваш главный экран
    );
  }
}
