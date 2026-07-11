import 'package:flutter/material.dart';

class PageViewApp extends StatelessWidget {
  const PageViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView пример'),
      ),
      body: PageView(
        children: [
          page('Добро пожаловать', Colors.blue),
          page('Изучай Flutter', Colors.green),
          page('Создавай приложения', Colors.orange),
        ],
      ),
    );
  }
}

Widget page(String text, Color color) {
  return Container(
    color: color,
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}