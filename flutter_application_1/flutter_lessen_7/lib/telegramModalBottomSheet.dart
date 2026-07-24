import 'package:flutter/material.dart';

class TelegramBottomSheet extends StatelessWidget {
  const TelegramBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram BottomSheet',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF2AABEE),
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const TelegramHomePage(),
    );
  }
}

class TelegramHomePage extends StatelessWidget {
  const TelegramHomePage({super.key});

  void showTelegramBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isDismissible: true,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 16),
            bottomItem(
              context,
              icon: Icons.group_add,
              text: 'Новая группа',
            ),
            bottomItem(
              context,
              icon: Icons.lock,
              text: 'Новый секретный чат',
            ),
            bottomItem(
              context,
              icon: Icons.campaign,
              text: 'Новый канал',
            ),
            bottomItem(
              context,
              icon: Icons.person_add,
              text: 'Добавить контакт',
            ),
            bottomItem(
              context,
              icon: Icons.qr_code,
              text: 'Сканировать QR',
            ),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }

  Widget bottomItem(
    BuildContext context, {
    required IconData icon,
    required String text,
  }) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$text выбрано'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Telegram'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showTelegramBottomSheet(context),
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text(
          'Список чатов',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}