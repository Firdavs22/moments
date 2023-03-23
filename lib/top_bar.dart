import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final double fontSize;
  final Color textColor;
  final Color iconColor;
  final String userName;
  final String avatarUrl;

  const TopBar({
    Key? key,
    this.fontSize = 17.0,
    this.textColor = const Color.fromARGB(255, 0, 0, 0),
    this.iconColor = Colors.black,
    required this.avatarUrl,
    required this.userName, // Задайте нужный цвет здесь
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Информация о пользователе'),
          content:
              const Text('Здесь будет отображаться информация о пользователе.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Закрыть'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Измените порядок виджетов здесь
          NeumorphicButton(
            onPressed: () {
              _showDialog(context);
            },
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            ),
            child: Icon(Icons.person, color: iconColor),
          ),
          Text(
            'moments',
            style: TextStyle(fontSize: fontSize, color: textColor),
          ),
        ],
      ),
      centerTitle: false,
      automaticallyImplyLeading: false,
    );
  }
}
