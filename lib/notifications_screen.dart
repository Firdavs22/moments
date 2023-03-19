import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: const Text('Уведомления'),
      ),
      body: ListView(
        children: [
          notificationSection('Уведомления о публикациях', [
            notificationItem('Лайки', Icons.favorite_border),
            notificationItem('Комментарии', Icons.comment),
            notificationItem('Сохранения', Icons.bookmark_border),
          ]),
          notificationSection('Уведомления о сторис', [
            notificationItem('Просмотры', Icons.visibility),
            notificationItem('Ответы на сторис', Icons.reply),
          ]),
          notificationSection('Уведомления о подписках и подписчиках', [
            notificationItem('Новые подписчики', Icons.person_add),
            notificationItem('Подписки на вас', Icons.notifications_active),
          ]),
          notificationSection('Уведомления о живых трансляциях', [
            notificationItem('Начало трансляции', Icons.live_tv),
          ]),
          notificationSection('Прочие уведомления', [
            notificationItem('Оповещения об акциях и событиях', Icons.info),
          ]),
        ],
      ),
    );
  }

  Widget notificationSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Column(children: items),
      ],
    );
  }

  Widget notificationItem(String title, IconData icon) {
    return Neumorphic(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      child: Row(
        children: [
          NeumorphicIcon(
            icon,
            size: 24,
            style: NeumorphicStyle(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
