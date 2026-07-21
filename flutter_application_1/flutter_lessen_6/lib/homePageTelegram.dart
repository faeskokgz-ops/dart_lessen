import 'package:flutter/material.dart';
import 'appDrawer.dart';

class HomePageTelegram extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  const HomePageTelegram({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    final chats = [
      {'name': 'Алексей', 'message': 'Привет! Как дела?', 'time': '12:30', 'letter': 'А'},
      {'name': 'Flutter Group', 'message': 'Новое задание 🧑‍💻', 'time': '11:15', 'letter': 'F'},
      {'name': 'Мама', 'message': 'Позвони мне', 'time': '10:02', 'letter': 'М'},
      {'name': 'Telegram', 'message': 'Обновление приложения', 'time': 'Вчера', 'letter': 'Т'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Telegram'),
        centerTitle: true,
      ),
      drawer: AppDrawer(
        onToggleTheme: onToggleTheme,
        themeMode: themeMode,
      ),
      body: ListView.separated(
        itemCount: chats.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade200,
              child: Text(
                chat['letter']!,
                style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              chat['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(chat['message']!),
            trailing: Text(
              chat['time']!,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}