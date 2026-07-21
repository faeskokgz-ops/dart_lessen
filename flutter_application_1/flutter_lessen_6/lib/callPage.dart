import 'package:flutter/material.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    final calls = [
      {'name': 'Мама', 'date': 'Сегодня', 'incoming': true, 'letter': 'М'},
      {'name': 'Алексей', 'date': 'Вчера', 'incoming': false, 'letter': 'А'},
      {'name': 'Мария', 'date': '20 мая', 'incoming': true, 'letter': 'М'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Звонки'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: calls.length,
        itemBuilder: (context, index) {
          final call = calls[index];
          final bool isIncoming = call['incoming'] as bool;

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Text(
                call['letter'] as String,
                style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              call['name'] as String,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(call['date'] as String),
            trailing: Icon(
              isIncoming ? Icons.south_west : Icons.north_east,
              color: Colors.green,
            ),
          );
        },
      ),
    );
  }
}