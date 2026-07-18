import 'package:flutter/material.dart';
import 'navigationApp.dart';

class OrderPage extends StatelessWidget {
  final String productTitle;

  const OrderPage({super.key, required this.productTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Заказ и оплата')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ваш заказ:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(productTitle, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            const Text(
              'Способ оплаты',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Банковская карта'),
            ),
            const ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Электронный кошелёк'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('Оплатить', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Оплата прошла успешно')),
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ConfirmationPage(productTitle: productTitle),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}