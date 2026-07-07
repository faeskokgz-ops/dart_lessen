import 'package:flutter/material.dart';
import 'productCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Товары'),
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.52,
          padding: const EdgeInsets.all(10.0),
          children: [
            ProductCard(
              image: 'images/nike.jpg',
              title: 'Nike Air',
              price: '\$200',
              category: 'Обувь',
              rating: 5,
              sale: true,
            ),
            ProductCard(
              image: 'images/leatherbag.jpg',
              title: 'Smart Bag',
              price: '\$400',
              category: 'Аксессуары',
              rating: 4,
              sale: false,
            ),
            ProductCard(
              image: 'images/headphones.jpg',
              title: 'JBL Headphones',
              price: '\$150',
              category: 'Электроника',
              rating: 4,
              sale: true,
            ),
            ProductCard(
              image: 'images/shoes.jpg',
              title: 'Blue Shoes',
              price: '\$80',
              category: 'Обувь',
              rating: 3,
              sale: false,
            ),
          ],
        ),
      ),
    );
  }
}
