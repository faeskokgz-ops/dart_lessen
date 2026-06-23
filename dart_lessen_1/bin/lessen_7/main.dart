import 'device.dart';
import 'smart_lamp.dart';
import 'smart_speaker.dart';
import 'smart_thermostat.dart';
import 'adjustable.dart';
import 'battery_powered.dart';

void main() {
  List<Device> devices = [
    SmartLamp('Living Room Lamp'),
    SmartSpeaker('Kitchen Speaker'),
    SmartThermostat('Bedroom Thermostat'),
  ];

  for (var device in devices) {
    device.showInfo();
    device.turnOn();

    if (device is Adjustable) {
      var adjustable = device as Adjustable;
      adjustable.increase();
      device.showInfo();
    }

    if (device is BatteryPowered) {
      var battery = device as BatteryPowered;
      battery.showBattery();
    }

    print('-------------------------');
  }

  print('All devices processed.');
}
