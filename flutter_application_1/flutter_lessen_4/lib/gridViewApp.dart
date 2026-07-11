import 'package:flutter/material.dart';

class GridViewApp extends StatelessWidget {
  const GridViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Товары'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: const Icon(
                    Icons.shopping_bag,
                    size: 60,
                  ),
                ),
                Text('Товары ${index + 1}'),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    );
  }
}