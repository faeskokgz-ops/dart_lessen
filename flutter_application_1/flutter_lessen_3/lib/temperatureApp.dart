import 'package:flutter/material.dart';

class TemperatureApp extends StatefulWidget {
  @override
  _TemperatureAppState createState() => _TemperatureAppState();
}

class _TemperatureAppState extends State<TemperatureApp> {
  int temperature = 7;

  void _increaseTemperature() {
    setState(() {
      temperature++;
    });
  }

  void _decreaseTemperature() {
    setState(() {
      temperature--;
    });
  }

  void _resetTemperature() {
    setState(() {
      temperature = 7;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Счетчик температуры'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Температура',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10),
              Text(
                '$temperature градусов',
                style: TextStyle(fontSize: 48, color: Colors.orange, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _decreaseTemperature,
                    child: Text('Уменьшить'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.black,
                      elevation: 1,
                    ),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: _increaseTemperature,
                    child: Text('Увеличить'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.black,
                      elevation: 1,
                    ),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: _resetTemperature,
                    child: Text('Сброс'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.black,
                      elevation: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}