import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: const Text('Создать пост'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
         import 'package:flutter/material.dart';
import 'package:image_editor_pro/image_editor_pro.dart';

class EditImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Image'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final geteditimage = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageEditorPro(
                  appBarColor: Colors.blue,
                  bottomBarColor: Colors.blue,
                ),
              ),
            );
            // Handle the edited image here (upload or save it)
            print(geteditimage);
          },
          child: Text('Open Image Editor'),
        ),
      ),
    );
  }
}
 // Вставьте здесь ваш код для выбора и редактирования изображения

          // Описание и хэштеги
          Neumorphic(
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            ),
            child: TextField(
              controller: _descriptionController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: 'Описание...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(12),
              ),
            ),
          ),

          // Отметить людей
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: NeumorphicButton(
              onPressed: () {
                // Здесь ваш код для отметки людей
              },
              style: NeumorphicStyle(
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              ),
              child: const Text('Отметить людей'),
            ),
          ),

          // Добавление местоположения
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: NeumorphicButton(
              onPressed: () {
                // Здесь ваш код для добавления местоположения
              },
              style: NeumorphicStyle(
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              ),
              child: const Text('Добавить местоположение'),
            ),
          ),

          // Кнопка "Опубликовать"
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: NeumorphicButton(
              onPressed: () {
                // Здесь ваш код для публикации поста
              },
              style: NeumorphicStyle(
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              ),
              child: const Text('Опубликовать'),
            ),
          ),
        ],
      ),
    );
  }
}
