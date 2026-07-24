import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String name;
  final String surname;
  final String phone;
  final String email;
  final String login;

  const ResultPage({
    super.key,
    required this.name,
    required this.surname,
    required this.phone,
    required this.email,
    required this.login,
  });

  @override
  Widget build(BuildContext context) {
    final String initial = name.isNotEmpty ? name[0].toUpperCase() : '?';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Данные пользователя',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Colors.blue.shade300,
                    ],
                  ),
                ),
                child: CircleAvatar(
                  radius: 46,
                  backgroundColor: Colors.white,
                  child: Text(
                    initial,
                    style: TextStyle(
                      fontSize: 38,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  buildInfoRow(context, Icons.person_outline_rounded, 'Имя', name),
                  const Divider(height: 20),
                  buildInfoRow(context, Icons.badge_outlined, 'Фамилия', surname),
                  const Divider(height: 20),
                  buildInfoRow(context, Icons.phone_outlined, 'Телефон', phone),
                  const Divider(height: 20),
                  buildInfoRow(context, Icons.email_outlined, 'Email', email),
                  const Divider(height: 20),
                  buildInfoRow(context, Icons.account_circle_outlined, 'Логин', login),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(BuildContext context, IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 22,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 15, color: Colors.black87),
              children: [
                TextSpan(
                  text: '$label: ',
                  style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
                ),
                TextSpan(
                  text: value,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}