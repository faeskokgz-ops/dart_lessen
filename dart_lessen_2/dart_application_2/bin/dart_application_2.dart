import 'dart:io';

void main() {
  // Задание 1
  //  Прогулка по погоде 🌤️
  print('Enter your age:');
  String? ageInput = stdin.readLineSync();
  int age = int.parse(ageInput ?? '0');

  print('Enter the temperature:');
  String? tempInput = stdin.readLineSync();
  int temp = int.parse(tempInput ?? '0');

  if ((age >= 20 && age <= 45 && temp >= -20 && temp <= 30) ||
      (age < 20 && temp >= 0 && temp <= 28) ||
      (age > 45 && temp >= -10 && temp <= 25)) {
    print('You can go for a walk.');
  } else {
    print('Stay home.');
  }
// Задание 2
  //  День недели 🗓️
  print('Enter a day of the week (e.g., Monday):');
  String? dayInput = stdin.readLineSync();
  String day = (dayInput ?? '').trim().toLowerCase();

  switch (day) {
    case 'monday':
      print('It\'s the start of the week!');
      break;
    case 'tuesday':
    case 'wednesday':
    case 'thursday':
      print('Keep going, almost weekend!');
      break;
    case 'friday':
      print('Weekend is coming!');
      break;
    case 'saturday':
    case 'sunday':
      print('Enjoy your weekend!');
      break;
    default:
      print('Invalid day.');
  }
 // Задание 3
  // Проверка пароля 🔒
  print('Enter password:');
  String? password = stdin.readLineSync();

  if (password == null || password.isEmpty) {
    print('Password cannot be empty.');
  } else if (password.length < 6) {
    print('Password too short.');
  } else {
    if (password == 'dart123') {
      print('Access granted.');
    } else {
      print('Wrong password.');
    }
  }
}