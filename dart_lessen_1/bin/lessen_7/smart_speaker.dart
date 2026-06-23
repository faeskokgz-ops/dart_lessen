import 'device.dart';
import 'adjustable.dart';
import 'battery_powered.dart';

class SmartSpeaker extends Device with BatteryPowered implements Adjustable {
  int volume = 30; // Начальное значение по умолчанию

  SmartSpeaker(String name) : super(name);

  @override
  void turnOn() {
    print('Speaker $name is ON');
  }

  @override
  void turnOff() {
    print('Speaker $name is OFF');
  }

  @override
  void increase() {
    volume = (volume + 5).clamp(0, 100);
  }

  @override
  void decrease() {
    volume = (volume - 5).clamp(0, 100);
  }

  @override
  void showInfo() {
    print('Speaker: $name, Volume: $volume%');
  }
}