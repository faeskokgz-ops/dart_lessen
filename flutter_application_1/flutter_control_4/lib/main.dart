import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FeedbackScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Обратная связь'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Напишите нам',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Введите ваше имя и нажмите кнопку отправки',
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            FeedbackForm(),
          ],
        ),
      ),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  String name = "";
  bool isSent = false;
  
  final TextEditingController _controller = TextEditingController();
  String? errorText;
  String submittedName = "";

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Ваше имя',
            errorText: errorText,
            border: const OutlineInputBorder(),
          ),
          onChanged: (value) {
            name = value;
          },
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            if (name.trim().isEmpty) {
              setState(() {
                errorText = "Имя не должно быть пустым";
                isSent = false;
              });
            } else {
              setState(() {
                isSent = true;
                errorText = null;
                submittedName = name;
                name = "";
                _controller.clear();
              });
            }
          },
          child: const Text('Отправить'),
        ),
        const SizedBox(height: 20),
        if (isSent)
          Text(
            'Отправлено! Спасибо $submittedName',
            style: const TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold, 
              color: Colors.green,
            ),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}