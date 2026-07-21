import 'package:flutter/material.dart';
import 'callPage.dart';
import 'contactsPage.dart';

class AppDrawer extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  const AppDrawer({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    const telegramBlue = Color(0xFF2AABEE);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 170,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: telegramBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 34,
                    color: telegramBlue,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Акматов Абдубаис',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '+996 777 888 999',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          SwitchListTile(
            secondary: Icon(
              themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
            ),
            title: const Text('Тёмная тема'),
            value: themeMode == ThemeMode.dark,
            onChanged: (value) => onToggleTheme(),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Чаты'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text('Звонки'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CallPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_2),
            title: const Text('Контакты'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ContactsPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Настройки'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Экран Настройки')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Помощь'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}