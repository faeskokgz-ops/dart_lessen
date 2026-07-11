import 'package:flutter/material.dart';

class SingleChildScrollViewApp extends StatelessWidget {
  const SingleChildScrollViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Заголовок статьи',
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Сам текст статьи....\n' * 35,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('На главную'),
            ),
          ],
        ),
      ),
    );
  }
}