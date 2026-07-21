import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = [
      {'name': 'Алексей', 'status': 'в сети', 'letter': 'А'},
      {'name': 'Мария', 'status': 'в сети', 'letter': 'М'},
      {'name': 'Данияр', 'status': 'в сети', 'letter': 'Д'},
      {'name': 'Айдана', 'status': 'в сети', 'letter': 'А'},
      {'name': 'Flutter Teacher', 'status': 'в сети', 'letter': 'F'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Контакты'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Text(
                contact['letter']!,
                style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              contact['name']!,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              contact['status']!,
              style: const TextStyle(color: Colors.blue),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}