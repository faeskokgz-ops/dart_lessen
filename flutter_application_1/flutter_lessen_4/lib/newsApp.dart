import 'package:flutter/material.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const NewsHome();
  }
}

class NewsHome extends StatelessWidget {
  const NewsHome({super.key});

  final List<Map<String, String>> news = const [
    {
      'title': 'Заголовок новости 1',
      'subtitle': 'Краткое описание новости 1. Здесь помещается дополнительный текст для читателя.',
      'image': 'https://picsum.photos/seed/news0/400/200'
    },
    {
      'title': 'Заголовок новости 2',
      'subtitle': 'Краткое описание новости 2. Здесь помещается дополнительный текст для читателя.',
      'image': 'https://picsum.photos/seed/news1/400/200'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Новости')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: news.length,
        itemBuilder: (context, index) {
          final item = news[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  item['image']!,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item['subtitle']!,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}