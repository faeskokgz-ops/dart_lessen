import 'package:flutter/material.dart';

class TabViewApp extends StatelessWidget {
  const TabViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Приложение'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Новости'),
              Tab(text: 'Чаты'),
              Tab(text: 'Профиль'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Новости')),
            Center(child: Text('Чаты')),
            Center(child: Text('Профиль')),
          ],
        ),
      ),
    );
  }
}