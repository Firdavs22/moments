import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();

  void _signIn() {
    // Ваша логика для авторизации
  }

  void _goToRegistration() {
    // Ваша логика для перехода на экран регистрации
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Логотип
              Center(
                child: Image.asset(
                  'assets/minelogo.png', // Заменитена путь к вашему логотипу
                  height: 322,
                ),
              ),
// Spacer для размещения полей и кнопки ниже
              const Spacer(flex: 1),
// Поле для номера телефона и кнопка авторизации
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
// Поле для номера телефона
                  Neumorphic(
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10)),
                    ),
                    child: IntlPhoneField(
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        hintText: '',
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                  const SizedBox(height: 16), // Отступ между полем и кнопкой
// Кнопка авторизации с заданным размером
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(
                      width: 400,
                      height: 46,
                    ),
                    child: NeumorphicButton(
                      onPressed: _signIn,
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                      ),
                      child: const Center(child: Text('Войти')),
                    ),
                  ),
                ],
              ),
// Spacer для размещения полей и кнопки выше
              const Spacer(flex: 7),
// Надпись "Регистрация"
              GestureDetector(
                onTap: _goToRegistration,
                child: const Text(
                  'Registration',
                  style: TextStyle(
                    color: Color.fromRGBO(108, 108, 108, 1),
                    fontWeight: FontWeight.bold,
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
