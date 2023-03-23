import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: const Text('Регистрация'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset('assets/minelogo.png'),
              const SizedBox(height: 20),
              Neumorphic(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(12),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Номер телефона',
                    prefixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              NeumorphicButton(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // ignore: todo
                  // TODO: Реализовать регистрацию через Firebase
                },
                child: const Text('Зарегистрироваться'),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  // ignore: todo
                  // TODO: Вернуться на экран авторизации
                },
                child: const Text(
                  'Уже зарегистрированы? Войти',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
